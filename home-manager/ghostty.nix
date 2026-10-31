{ pkgs, ...}:
{
  home.packages = [ pkgs.nushell pkgs.ghostty ];
  xdg.configFile."ghostty/config".text = ''
    command = nu
  '';
}
