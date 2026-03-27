case "${BLA}" in
"" | *[!abcdefghijklmnopqrstuvwxyz1234567890-]*)
  {
    echo >&2 "Unsupported characters found in 'BLA'."
    exit 2
  }
  ;;
*) : ;;
esac
