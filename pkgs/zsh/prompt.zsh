# Set variables for easier prompt expansion. See SIMPLE PROMPT ESCAPES in the zshmisc man page
username=%n
hostname=%m
pwd=%~
newline=$'\n'
git='${vcs_info_msg_0_}'

autoload -Uz colors && colors   # Load & call colors function
autoload -Uz vcs_info           # Enable vcs_info function
zstyle ':vcs_info:*' enable git # Enable vcs info for git specifically

# %F/%f = start/stop text color
# %B/%b = start/stop bold color

# Configure vcs_info in prompt. See GATHERING INFORMATION FROM VERSION CONTROL SYSTEMS in the zshcontrib man page
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' formats '[%F{cyan}%s-%b%f] %u'
zstyle ':vcs_info:*' actionformats '[%F{magenta}%s-%b%f] %u'
zstyle ':vcs_info:*' unstagedstr '[%F{red}unstaged%f]' # This is expanded to %u in lines above

# Update vcs_info when prompt is printed to screen
precmd() {
  vcs_info
}

setopt PROMPT_SUBST # Set parameter expansion, command substitution, & arithmetic expansion in prompt

PROMPT="%B┌──[%F{magenta}${username}%f@%F{green}${hostname}%f] [%F{blue}${pwd}%f] ${git}${newline}\
└─%F{blue}$%f%b "
