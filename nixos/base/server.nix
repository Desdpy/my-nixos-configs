{ ... }: {

  # Use the systemd-boot EFI boot loader.
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # Easiest to use and most distros use this by default.
  networking.networkmanager = {   
    enable = true;
  };

  # Configure keymap in X11
  services.xserver.xkb.layout = "de";

  nix = {
    # Enable experimental features like flakes
    settings.experimental-features = ["nix-command" "flakes"];

    # Automatic garbage collection of old system generations
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };

  # use xkb.options in tty.
  console = {
    useXkbConfig = true; 
  };

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
}
