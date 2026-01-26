{config, pkgs, ...}: {
  programs.git.settings = {
    enable = true;
    user = {
      name = config.mySystem.username;
      email = config.mySystem.email;
    };
    # userName = config.mySystem.username;
    # userEmail = config.mySystem.email;
    aliases = {
      st = "status";
      ci = "commit";
      co = "checkout";
    };
    extraConfig = {
      color = {
        status = "auto";
        diff = "auto";
        branch = "auto";
        interactive = "auto";
        ui = "auto";
        sh = "auto";
      };
      init = { defaultBranch = "main"; };
      push = { default = "current"; };
      pull = { rebase = "true"; }; 

      merge = {
        cnoflictstyle = "diff3";
        stat = true;
        tool = "nvim";
      };

      mergetool = {
        prompt = false;
        keepBackup = false;
      };

      "mergetool \"nvim\"" = {
        cmd = 
          ''nvim -d -c "windcmd l" -c "norm ]c" "$LOCAL" "$MERGED" "$REMOTE"'';
      };

      diff = {
        ignoreSubmodules = "dirty";
        renames = "copies";
        mnemonicprefix = true;
      };

      advice = {
        statusHints = false;
        pushNonFastForward = false;
        objectNameWarning = "fasle";
      };
    };

    delta = { enable = true; }; 
  };
}
