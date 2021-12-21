# History file for zsh. See History entry in man zshoptions for options
export HISTSIZE=1000                # set history size
export SAVEHIST=1000                # save history after logout
export HISTFILE=$HOME/.zsh/zhistory # save to history file
setopt INC_APPEND_HISTORY           # append to this history file
setopt EXTENDED_HISTORY             # add timestamp for each history entry
setopt HIST_IGNORE_DUPS             # avoid duplicate entries
setopt HIST_IGNORE_SPACE            # remove commands that contain leading space
