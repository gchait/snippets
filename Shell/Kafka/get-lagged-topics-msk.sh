seq 1 "${BROKERS_NUM}" | xargs -I {} wget \
  -q "b-{}.${REST_OF_BROKER_FQDN}:${JMX_EXPORTER_PORT}/metrics" -O /dev/stdout | \
  grep kafka_consumer_group_ConsumerLagMetrics_Value | \
  grep -v "^#" | grep -Eo 'topic=".+",' | sort -u | \
  cut -d'"' -f2 | sort | uniq -c
