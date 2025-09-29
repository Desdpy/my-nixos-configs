{ pkgs, ... }: {

 # Easiest to use and most distros use this by default.
  networking.networkmanager = {   
    enable = true;
    plugins = with pkgs; [
      networkmanager-openvpn
    ];
  };
}
