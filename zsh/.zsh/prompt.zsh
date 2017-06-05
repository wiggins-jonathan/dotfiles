# Set variables for easier prompt expansion
username=%n
hostname=%m
pwd=%~
newline=$'\n'
prompt=%#

PROMPT="┌──[%F{magenta}${username}%f@%F{magenta}${hostname}%f] [%F{blue}%B${pwd}%b%f]${newline}└─${prompt} "
