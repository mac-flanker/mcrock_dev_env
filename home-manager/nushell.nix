{pkgs, ... }: {
  programs.nushell = {
    enable = true;
    plugins = with pkgs.nushellPlugins; [
      formats
      polars
      query
    ];
    settings = {
      edit_mode = "vi";
    };
  };
}
