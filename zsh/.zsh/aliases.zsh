alias ls='ls -lAhN --color=auto --group-directories-first'
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias ip='ip -c'
alias ssh="TERM=termite ssh"
alias vi=nvim
alias tmux='tmux -f $HOME/.config/tmux/tmux.conf'

# cd & ls together forever
cdl() {
  builtin cd "$@" && ls;
}
