docker images -q "${DOCKER_REPO_FULL}" | \
  grep -v "$(docker images -q ${DOCKER_IMAGE})" | \
  xargs --no-run-if-empty docker rmi -f
