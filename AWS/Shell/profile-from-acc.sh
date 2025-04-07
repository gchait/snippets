export AWS_PROFILE=$(grep -B20 "${ACCOUNT_ID}" ~/.aws/config | \
  grep "^\[" | tail -1 | tr -d "[]" | awk '{print $NF}')
