{ pkgs, lib, ... }:
{
  gtk = {
    enable = true;
    theme = {
      name = "catppuccin-frappe-blue-standard";
      package = pkgs.catppuccin-gtk;
    };
  };

  home.activation.removeExistingGtk = lib.hm.dag.entryBefore ["checkLinkTargets"] ''
    rm -rf ~/.gtkrc-2.0
  '';
}