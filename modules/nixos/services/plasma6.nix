{ pkgs, ... }: {

  # Enable KDE Plasma
  services.desktopManager.plasma6 = {
    enable = true;
  };

  # Exclude KDE packages
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    
  ];
}
