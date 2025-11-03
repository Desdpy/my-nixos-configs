{ pkgs, ... }: {

  boot = {
    # Use the systemd-boot EFI boot loader.
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    plymouth = {
      enable = true;
      theme = "circle";
      themePackages = with pkgs; [
        # By default we would install all themes
        (adi1090x-plymouth-themes.override {
          selected_themes = [ "circle" ];
        })
      ];
    };

    # Enable "Silent boot"
    consoleLogLevel = 3;
    initrd.verbose = false;
    initrd.systemd.enable = true;
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "udev.log_priority=3"
      "rd.systemd.show_status=auto"
    ];
    # Hide the OS choice for bootloaders.
    # It's still possible to open the bootloader list by pressing any key
    # It will just not appear on screen unless a key is pressed
    loader.timeout = 0;
  };

  # Easiest to use and most distros use this by default.
  networking.networkmanager = {   
    enable = true;
    plugins = with pkgs; [
      networkmanager-openvpn
    ];
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
