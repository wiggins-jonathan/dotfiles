alias ll='ls -lAhN --color=auto --group-directories-first'
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias ip='ip -c'
alias vi=nvim
alias tmux='tmux -f $HOME/.config/tmux/tmux.conf'
alias venv='source .venv/bin/activate'

# cd & ls together forever
cdl() {
  builtin cd "$@" && ll;
}
