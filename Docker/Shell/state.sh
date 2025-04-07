docker inspect --format \
  "{{.State.Running}} {{.State.Status}} {{.RestartCount}}" "${ID}"
