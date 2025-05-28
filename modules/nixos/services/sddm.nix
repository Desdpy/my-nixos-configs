{ pkgs, ... }: {

  # Enable display manager
  services.displayManager.sddm.enable = true;

  environment.systemPackages = [
    (pkgs.writeTextDir "share/sddm/themes/breeze/theme.conf.user" ''
      [General]
      background=${../../../wallpapers/river-city.jpg}
    '')
  ];

}
