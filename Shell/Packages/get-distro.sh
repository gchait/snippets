release=$(grep "^ID=" /etc/os-release | cut -d"=" -f2 | tr -d '"')
if [ "${release}" = "almalinux" ]; then echo yes; fi
