# type: ignore
# pylint: disable=undefined-variable
# ruff: noqa: F821
"""Translate EC2/RDS instance types to their CPU and memory sizes."""

from botocore.exceptions import ClientError


def instance_type_to_cpu_mem(
    region: str, instance_type: str
) -> tuple[int, float] | None:
    """Translate an EC2/RDS instance type to CPUs and Memory."""
    client = ec2_clients[region]
    if instance_type.startswith("db."):
        instance_type = instance_type.removeprefix("db.")

    try:
        ec2_response = client.describe_instance_types(InstanceTypes=[instance_type])
        matched_type = ec2_response["InstanceTypes"][0]

        cpu = matched_type["VCpuInfo"]["DefaultVCpus"]
        mem = matched_type["MemoryInfo"]["SizeInMiB"] / 1024
        return cpu, mem

    except (KeyError, IndexError):
        return None
    except ClientError as e:
        if e.response["Error"]["Code"] == "InvalidInstanceType":
            return None
        raise
