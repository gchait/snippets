# shellcheck disable=SC2016
export COMPOSE_FILE=compose.yaml
export COMPOSE_PROJECT_NAME=xyz
export COMPOSE_IGNORE_ORPHANS=true

case "${1}" in
1) action="up --detach" reverse="" ;;
0) action="down" reverse="reverse |" ;;
*) echo "Please specify either 1 or 0." >&2 && exit 2 ;;
esac

shift 1

enabled_components=$(yq "${reverse} .[] | select(.enabled) | .path" components.yaml)
disabled_components=$(yq "${reverse} .[] | select(.enabled | not) | .path" components.yaml)

echo "${enabled_components}" | xargs -I {} bash -c 'cd "${1}" && shift && docker compose ${0} "${@}" &> /dev/null' "${action}" {} "${@}"
echo "${disabled_components}" | xargs -I {} bash -c 'cd "${1}" && docker compose down &> /dev/null' _ {}
