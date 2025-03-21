(){
  local ins_prompt="${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
  [ -r "${ins_prompt}" ] && source "${ins_prompt}"
}

fpath=("${HOME}/.zsh/complete/src" "${fpath[@]}")
zle_highlight=("paste:none")

export EDITOR="vim"
export PAGER="less"
export HISTSIZE="4000"
export SAVEHIST="${HISTSIZE}"
export HISTFILE="${HOME}/.zsh_history"

precmd() {
  echo -ne "\033]0;${PWD##*/}\007"
}

p() {
  sudo pamac "${@:-update}"
}

ij() {
  (idea "${1:-$HOME/Projects}" &> /dev/null &)
}

jwtd() {
  if [ ! -t 0 ]; then
    local input=$(cat /dev/stdin)
  else
    >&2 echo "Missing piped input."
    return 2
  fi

  echo "${input}" | jq -Rrce 'split(".")[1] | . + "=" * (. | 4 - length % 4)' | \
    openssl base64 -d -A | jq
}

alias j="just"
alias d="docker"
alias c="code"
alias g="git"
alias ff="fastfetch"
alias ls="eza -a --group-directories-first"
alias lt="ls -T --git-ignore"
alias ll="ls -l"
alias df="df -hT"
alias du="du -sh"
alias cat="bat --paging=never --style=plain"

bindkey -e
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word
bindkey "^[[3~" delete-char

autoload -Uz compinit && compinit
zstyle ":completion:*" matcher-list "m:{a-z}={A-Za-z}"
setopt hist_ignore_all_dups

source "${HOME}/.zsh/highlight/zsh-syntax-highlighting.zsh"
source "${HOME}/.zsh/suggest/zsh-autosuggestions.zsh"
source "${HOME}/.zsh/p10k/powerlevel10k.zsh-theme"

[ -r "${HOME}/.hidden_zshrc" ] && source "${HOME}/.hidden_zshrc"
source "${HOME}/.p10k.zsh"
