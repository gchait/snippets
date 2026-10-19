find / \( -path /proc -o -path /sys \) -prune -o -user 1002 -exec chown -h 1001 {} + 2> /dev/null || true
