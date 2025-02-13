case "${BLA}" in
  ("" | *[!abcdefghijklmnopqrstuvwxyz1234567890-]*)
    { >&2 echo "Unsupported characters found in 'BLA'."; exit 2; } ;;
  *) : ;;
esac
