{
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    installVimSyntax = true;
    settings = {
      font-family = "Hack";
      font-size = 12;
      unfocused-split-opacity = 0.9;
      mouse-hide-while-typing = true;
      theme = "Dark Pastel";
      shell-integration-features = "no-cursor";
      cursor-style = "block";
    };
  };
}
