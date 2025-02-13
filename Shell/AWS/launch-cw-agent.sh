echo -n '${CWAGENT_CONFIG}' > /tmp/cwagent.json
/opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl \
  -a fetch-config -m ec2 -s -c file:/tmp/cwagent.json
rm -f /tmp/cwagent.json
systemctl daemon-reload
