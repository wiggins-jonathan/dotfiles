{ pkgs, ... }:

{
  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      extraLuaConfig = "
        ${builtins.readFile ./init.lua}
        ${builtins.readFile colors/theme.lua}
      ";
      plugins = [ # install treesitter plugins
        (pkgs.vimPlugins.nvim-treesitter.withPlugins (p: with p; [
          go
          gomod
          python
          dockerfile
          lua
          nix
          yaml
          json
          html
          css
          markdown
          terraform
          git_rebase
        ]))
      ];
    };
  };
}
