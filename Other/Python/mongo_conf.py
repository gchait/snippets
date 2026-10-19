"""MongoDB client settings, read from the environment."""

from os import getenv

from certifi import where as certs_where

mongo_tls = getenv("MONGO_TLS", None) == "true"
mongo_config = {
    "host": getenv("MONGO_HOST", "mongodb"),
    "username": getenv("MONGO_USER", None),
    "password": getenv("MONGO_PASS", None),
    "tls": mongo_tls,
    "tlsCAFile": certs_where() if mongo_tls else None,
    "retryWrites": False,
}
