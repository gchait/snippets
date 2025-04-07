awk '{print $1}' /proc/uptime | cut -d"." -f1
