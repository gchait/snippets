#!/bin/bash
eval $(aws sts assume-role --role-arn arn:aws:iam::123456789123:role/myAwesomeRole --role-session-name test | jq -r '.Credentials | "export AWS_ACCESS_KEY_ID=\(.AccessKeyId)\nexport AWS_SECRET_ACCESS_KEY=\(.SecretAccessKey)\nexport AWS_SESSION_TOKEN=\(.SessionToken)\n"')
