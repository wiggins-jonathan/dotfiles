# Activate zsh-syntax-highlighting for Ubuntu or Arch.
# See github.com/zsh-users/zsh-syntax-highlighting
if [[ -f /etc/os-release ]]; then
  source /etc/os-release
  OS=$NAME

  if [[ "$OS" == "Arch Linux" ]]; then
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  elif [[ "$OS" == "Ubuntu" ]]; then
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  else
    echo "Can't find zsh-syntax-highlighting file for this distro."
  fi
fi

# wrapper for man to add color
man() {
    LESS_TERMCAP_mb=$'\e'"[1;31m" \
    LESS_TERMCAP_md=$'\e'"[1;31m" \
    LESS_TERMCAP_me=$'\e'"[0m" \
    LESS_TERMCAP_se=$'\e'"[0m" \
    LESS_TERMCAP_so=$'\e'"[1;44;33m" \
    LESS_TERMCAP_ue=$'\e'"[0m" \
    LESS_TERMCAP_us=$'\e'"[1;32m" \
    command man "$@"
}
