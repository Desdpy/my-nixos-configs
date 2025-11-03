{ pkgs, ... }: {

  home.packages = with pkgs; [
    spice
    spice-gtk
    spice-protocol
    win-spice
  ];
}