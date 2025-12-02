{
  programs = {
    git = {
      enable = true;
      settings = {
        user.email = "jonathan@wiggins.tech";
        user.name = "Jonathan Wiggins";
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
