"""Lambda handler that echoes the invocation event back as JSON."""

import json


def handler(event, _):
    """Returns the event serialized as JSON."""
    return json.dumps(event)
