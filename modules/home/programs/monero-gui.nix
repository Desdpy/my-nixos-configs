{ pkgs, ... }: {

  home.packages = [ 
    pkgs.monero-gui
    pkgs.monero-cli
  ];
}