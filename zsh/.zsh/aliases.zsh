alias ll='ls -lAhNv --color=auto --group-directories-first'
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias ip='ip -c'
alias vi=nvim
alias venv='source .venv/bin/activate'
alias tf='terraform'
alias ap='ansible-playbook'

# cd & ls together forever
cdl() {
  builtin cd "$@" && ll;
}
