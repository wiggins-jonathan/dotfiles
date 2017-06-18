# Load & call Zsh autocompletion system
autoload -Uz compinit && compinit

# Load function for autocompletion on aliases
setopt COMPLETE_ALIASES

#Set LS_COLORS environmental variable
eval $(dircolors ~/.dircolors)

# Load support for colors in ls autocompletion.
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Colors for the kill command
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

# Set color for the less command using the source-highlight program
export LESSOPEN="| /usr/bin/source-highlight-esc.sh %s"
export LESS=' -R '

# Use menu select tab completion instead of autocomplete
zstyle ':completion:*' menu select

