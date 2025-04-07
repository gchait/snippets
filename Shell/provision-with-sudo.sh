provision() {
  xx() {
    :
  }

  yy() {
    :
  }

  zz() {
    :
  }

  xx
  yy
  zz
}

sudo -E bash -euc "$(declare -f provision); provision"
