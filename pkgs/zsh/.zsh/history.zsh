# History file for zsh. See History entry in man zshoptions for options
export HISTSIZE=10000                 # set history size
export SAVEHIST=10000                 # save history after logout
export HISTFILE=${HOME}/.zsh/zhistory # save to history file
export HISTORY_IGNORE="(clear|history|l[ls]|pwd|exit|fc -*)"

setopt INC_APPEND_HISTORY # append to the history file
setopt EXTENDED_HISTORY   # add timestamp for each history entry
setopt HIST_IGNORE_DUPS   # avoid duplicate entries
setopt HIST_IGNORE_SPACE  # remove commands that contain leading space
