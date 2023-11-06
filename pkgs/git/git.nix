{
  programs = {
    git = {
      enable = true;
      userName = "Jonathan Wiggins";
      userEmail = "jonathan@wiggins.tech";
      extraConfig = {
        pull.rebase = true;
        fetch.prune = true;
        diff.colorMoved = "zebra";
        init.defaultBranch = "main";
        push.autoSetupRemote = true;
        rebase.autosquash = true;
        rebase.autostash = true;
        commit.verbose = true;
      };
    };
  };
}
