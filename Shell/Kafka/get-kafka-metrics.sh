wget "${BROKER_FQDN}:${JMX_EXPORTER_PORT}/metrics" -O /dev/stdout | \
    grep -v "^#" | cut -d"{" -f1 | cut -d" " -f1 | sort -u
