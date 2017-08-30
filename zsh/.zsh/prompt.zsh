# Set variables for easier prompt expansion. See SIMPLE PROMPT ESCAPES in the zshmisc man page
username=%n
hostname=%m
pwd=%~
newline=$'\n'
prompt=%#
git='${vcs_info_msg_0_}'

# %F/%f = start/stop text color
# %B/%b = start/stop bold color

# Load & call colors function
autoload -Uz colors && colors

autoload -Uz vcs_info			# Enable vcs_info function
zstyle ':vcs_info:*' enable git		# Enable vcs info for git specifically

# Configure vcs_info in prompt. See GATHERING INFORMATION FROM VERSION CONTROL SYSTEMS in the zshcontrib man page
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr '[%F{red}↑%f]'
zstyle ':vcs_info:*' unstagedstr '[%F{red}%f]'
zstyle ':vcs_info:*' formats '[%F{red}%s-%b%f] %c%u'
zstyle ':vcs_info:*' actionformats '[%F{magenta}%s-%b%f] %c%u'

# Update vcs_info when prompt is printed to screen
precmd() {
	vcs_info
}

setopt PROMPT_SUBST	# Set parameter expansion, command substitution, & arithmetic expansion in prompt

PROMPT="%B┌──[%F{magenta}${username}%f@%F{magenta}${hostname}%f] [%F{blue}${pwd}%f] ${git}${newline}\
└─${prompt}%b "
