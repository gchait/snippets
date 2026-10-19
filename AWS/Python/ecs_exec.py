# type: ignore
"""
Some functions to make ECS easier to use.
"""

import json
import uuid

import construct as c
import websocket


def ecs_execute_command(ecs_client, cluster: str, task: str, command: str) -> str:
    """Executes a bash command/script inside an ECS task and returns the output"""
    exec_resp = ecs_client.execute_command(
        interactive=True, cluster=cluster, task=task, command=f"bash -c '{command}'"
    )

    session = exec_resp["session"]
    connection = websocket.create_connection(session["streamUrl"])

    try:
        connection.send(
            json.dumps(
                {
                    "MessageSchemaVersion": "1.0",
                    "RequestId": str(uuid.uuid4()),
                    "TokenValue": session["tokenValue"],
                }
            )
        )

        agent_message_header = c.Struct(
            "HeaderLength" / c.Int32ub,
            "MessageType" / c.PaddedString(32, "ascii"),
            "SchemaVersion" / c.Int32ub,
            "CreatedDate" / c.Int64ub,
            "SequenceNumber" / c.Int64sb,
            "Flags" / c.Int64ub,
            "MessageId" / c.Bytes(16),
            "PayloadDigest" / c.Bytes(32),
            "PayloadType" / c.Int32ub,
        )

        agent_message_payload = c.Struct(
            "PayloadLength" / c.Int32ub,
            "Payload" / c.Bytes(c.this.PayloadLength),
        )

        output = {}
        while True:
            try:
                response = connection.recv()
            except websocket.WebSocketConnectionClosedException:
                if not output:
                    raise
                break

            message = agent_message_header.parse(response)

            if "channel_closed" in message.MessageType:
                break

            if "output_stream_data" in message.MessageType and message.PayloadType in (
                1,
                11,
            ):
                payload = agent_message_payload.parse(response[message.HeaderLength :])
                output[message.SequenceNumber] = payload.Payload

    finally:
        connection.close()

    if not output:
        raise RuntimeError("Channel closed before command output was received")

    data = b"".join(output[n] for n in sorted(output))
    return c.PaddedString(len(data), "utf8").parse(data)
