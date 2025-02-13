while read -ru70 thing; do
  ./bla.sh "${thing}"
done 70<<< "${THINGS}"
