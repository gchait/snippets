something=(
  "one   11"
  "two   22"
  "three 33"
  "four  44"
)

parallel -j4 -n2 ./bla.sh -- ${something[@]}
