# Set variables for easier prompt expansion
username=%n
hostname=%m
pwd=%~
newline=$'\n'
prompt=%#
#git=$(__git_ps1 "%s")

# %F/%f = start/stop text color
# %B/%b = start/stop bold color

setopt PROMPT_SUBST

PROMPT="%B┌──[%F{magenta}${username}%f@%F{magenta}${hostname}%f] \
[%F{blue}${pwd}%f]${newline}\
└─${prompt}%b "

RPROMPT='%B%F{red}$(__git_ps1 "[%s]")%f%b'
#RPROMPT=${git}
