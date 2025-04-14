for jar in ${MORE_JARS}; do \
  curl -so $(echo "${jar}" | awk -F/ '{print $NF}') "${jar}"; done
