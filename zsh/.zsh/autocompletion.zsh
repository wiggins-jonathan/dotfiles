autoload -Uz compinit && compinit # Load & call zsh autocompletion system
setopt COMPLETE_ALIASES           # Load function for autocompletion on aliases
eval $(dircolors ~/.dircolors)    # Set LS_COLORS environmental variable

# Load support for colors in ls autocompletion.
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Colors for the kill command
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'	

# Use menu select tab completion instead of autocomplete
zstyle ':completion:*' menu select	
