{ pkgs, ... }: {

  # Enable sound.
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    extraConfig.pipewire."92-crackle-at-load-fix-pipewire" = {
      "context.properties" = {
        "default.clock.rate" = 48000;
        "default.clock.quantum" = 2048;
        "default.clock.min-quantum" = 2048;
        "default.clock.max-quantum" = 8192;
      };
    };
    extraConfig.pipewire-pulse."92-crackle-at-load-fix-pulse" = {
      "context.properties" = [
        {
          name = "libpipewire-module-protocol-pulse";
          args = { };
        }
      ];
      "pulse.properties" = {
        "pulse.min.req" = "2048/48000";
        "pulse.default.req" = "2048/48000";
        "pulse.max.req" = "2048/48000";
        "pulse.min.quantum" = "2048/48000";
        "pulse.max.quantum" = "2048/48000";
      };
      "stream.properties" = {
        "node.latency" = "2048/48000";
        "resample.quality" = 1;
      };
    };
  };

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    excludePackages = [
      pkgs.xterm
    ];
  };

  # Enable display manager
  services.displayManager.sddm.enable = true;

  environment.systemPackages = [
    (pkgs.writeTextDir "share/sddm/themes/breeze/theme.conf.user" ''
      [General]
      background=${../../wallpapers/river-city.jpg}
    '')
  ];

  # Enable KDE Plasma
  services.desktopManager.plasma6 = {
    enable = true;
  };

  # Exclude KDE packages
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    
  ];

  # Enable the gnome-keyring secrets vault.
  # Will be exposed through DBus to programs willing to store secrets.
  services.gnome.gnome-keyring.enable = true;
}