{ ... }: {

  imports = [

    # misc
    ./misc/defaultLocale.nix
    ./misc/console.nix

  ];

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

  # Enable experimental features like flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Automatic garbage collection of old system generations
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  # use xkb.options in tty.
  console = {
    useXkbConfig = true; 
  };
}
