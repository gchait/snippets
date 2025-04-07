"${tail_command[@]}" | while read -r datetime rest; do
  local new_datetime=$("${DATEUTIL}" -d "${datetime} UTC" +"%d/%m/%y %H:%M:%S")
  echo "${new_datetime} ${rest}"
done
