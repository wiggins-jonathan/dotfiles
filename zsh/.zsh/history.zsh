# set history size
export HISTSIZE=1000
# save history after logout
export SAVEHIST=1000
# save to history file
export HISTFILE=~/.zsh/zhistory
# append to this history file
setopt INC_APPEND_HISTORY
# add timestampt for each history entry
setopt EXTENDED_HISTORY
# avoid duplicate entries
setopt HIST_IGNORE_DUPS
