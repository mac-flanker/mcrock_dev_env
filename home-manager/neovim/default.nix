{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    coc.enable = false;
    vimAlias = true;
    extraLuaPackages = ps: [ ps.magick ];
    extraPackages = [
      pkgs.imagemagick
      pkgs.pyright
      pkgs.ruff
      pkgs.rust-analyzer
      pkgs.tree-sitter
    ];
    extraPython3Packages = [
      jupyter-client
      nbformat
      pynvim
      pypercli
    ];
  }
  xdg.configFile."nvim" = {
    source = ./nvim;
    recursive = true;
  };
}
