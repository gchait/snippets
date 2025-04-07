#!/bin/bash -eux

__get_repo() {
  # shellcheck disable=SC2015
  cd "${1}" && git pull || git clone --depth=1 "${2}" "${1}"
}

__get_repo "${HOME}/.zsh/complete" https://github.com/zsh-users/zsh-completions.git
__get_repo "${HOME}/.zsh/highlight" https://github.com/zsh-users/zsh-syntax-highlighting.git
__get_repo "${HOME}/.zsh/suggest" https://github.com/zsh-users/zsh-autosuggestions.git
__get_repo "${HOME}/.zsh/p10k" https://github.com/romkatv/powerlevel10k.git
