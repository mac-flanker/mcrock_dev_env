{
  pkgs,
  config,
  lib,
  ...
}:
{
  programs.home-manager.enable = true;
  home.username = config.mySystem.username;
  home.homeDirectory = config.mySystem.homeDirectory;
  home.sessionPath = [ "${config.mySystem.homeDirectory}/.local/bin" ];
  home.stateVersion = "25.05";

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

# Add packages that aren't supported by home-manager here
  home.packages = with pkgs; [
    nixd # nix language server
    nixfmt
    poetry
    python313
    python313Packages.python-lsp-server
    rustup
  ];

  imports = [
    ./git.nix
    ./ghostty.nix 
    ./nushell.nix
    ./zsh.nix
  ];

  # Smart shel history
  programs.atuin = {
    enable = true;
    flags = [ "--disable-up-arrow" ];
    settings = {
      auto_sync = false;
      auto_check = false;
      style = "auto";
    };
    enableNushellIntegration = true;
    enableZshIntegration = true;
  };

  programs.starship = {
    enable = true;
    settings = {
      command_timeout = 2000;
      shell = {
        disabled = false;
        nu_indicator = "[<](#3aa675)";
        zsh_indicator = "λ";
      };
    };
    enableNushellIntegration = true;
    enableZshIntegration = true;
  };

  # fast file find
  programs.fd.enable = true;

  #zi gives commands for searching for directories
  programs.zoxide = {
    enable = true;
    enableNushellIntegration = true;
    enableZshIntegration = true;
  };

  programs.man = {
    generateCaches = false;
  };

  programs.lazygit.enable = true;
  programs.fzf.enable = true;
  programs.bat.enable = true;

  programs.readline = {
    enable = true;
    variables = {
      "editing-mode" = "vi";
    };
  };
}
