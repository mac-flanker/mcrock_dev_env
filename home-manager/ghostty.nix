{ pkgs, ...}:
{
  home.packages = [ pkgs.nushell ];
  xdg.configFile."ghostty/config".text = ''
    command = ${pkgs.nushell}/bin/nu
  '';
}
