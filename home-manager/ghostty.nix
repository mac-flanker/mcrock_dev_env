{ pkgs, ...}:
{
  home.packages = [ pkgs.nushell ];
  xdg.configFile."ghostty/config".text = ''
    command = nu
  '';
}
