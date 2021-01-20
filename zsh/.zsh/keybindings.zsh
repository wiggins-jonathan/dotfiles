# Hit ESC to enter vi mode
bindkey -v

# mapping escape sequences to keys using bindkey.
# Get the ANSI escape sequences using showkey -a.
bindkey "^R" history-incremental-search-backward  # Ctrl+r search
bindkey "^[[H" beginning-of-line                  # home
bindkey "^[[F" end-of-line                        # end
bindkey "^[[3~" delete-char                       # delete
