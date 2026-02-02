{pkgs, ... }: {
    programs.zed-editor = {
        enable = true;
        extensions = [
          "json"
          "make"
          "markdown"
          "nix"
          "toml"
          "yaml"
          #Programming
          "python"];
        userSettings = {
          theme = "One Dark";
          hour_format = "hour24";
          vim_mode = "true";
        };
    };
}
