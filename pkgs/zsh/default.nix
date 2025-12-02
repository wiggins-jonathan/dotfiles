{ config, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableVteIntegration = true;  # track current working dir
    dotDir = "${config.xdg.configHome}/zsh";
    history = {
      extended = true;    # add timestamp to history file
      ignoreDups = true;
      ignoreSpace = true;
      path = "${config.xdg.configHome}/zsh/zhistory";
    };
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    initContent = ''
      # cd & ls at the same time
      cdl() { builtin cd "$@" && ls -lAhNv --color=auto --group-directories-first }

      bindkey "^R" history-incremental-search-backward  # Ctrl+r search
      bindkey "^[[H" beginning-of-line                  # home
      bindkey "^[[F" end-of-line                        # end
      bindkey "^[[3~" delete-char                       # delete

      ${builtins.readFile ./prompt.zsh}
      ${builtins.readFile ./ssh-agent.zsh}
    '';
  };
}
