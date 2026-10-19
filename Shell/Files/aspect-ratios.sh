# shellcheck disable=SC2016
exiftool -q -if '$ImageWidth and $ImageHeight' -p '$ImageWidth $ImageHeight $Directory/$FileName' ./* |
  awk '{ w=$1; h=$2; sub(/^[^ ]+ [^ ]+ /, ""); printf "%-50s %.5f\n", $0, w/h }'
