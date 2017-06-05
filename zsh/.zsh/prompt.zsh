# Set variables for easier prompt expansion
username=%n
hostname=%m
pwd=%~
newline=$'\n'
prompt=%#

PROMPT="┌──[${username}@${hostname}] [${pwd}]${newline}└─${prompt} "
