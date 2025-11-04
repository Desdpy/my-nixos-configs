{ ... }: {
  imports = [

    # programs
    ./programs/chromium.nix
    ./programs/android-udev-rules.nix

  ];
}

{ pkgs, ... }: {

  home.packages = with pkgs; [ 
    android-udev-rules
    chromium
  ];
}