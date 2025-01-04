. ./.env

# ./manage.py collectstatic --noinput
./manage.py migrate

# shellcheck disable=SC2046
gunicorn xx.wsgi \
  --workers "${WORKERS}" \
  --threads "${THREADS}" \
  --bind "0.0.0.0:${PORT}" \
  --access-logfile - \
  --log-level $([ "${DEBUG:-0}" = 1 ] && echo debug || echo info)
