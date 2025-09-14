{ ... }: {

  imports = [

    # boot
    ./boot/systemd-boot.nix
    ./boot/plymouth.nix

    # network
    ./networking/networkmanager.nix

    # hardware
    ./hardware/sane.nix

    # services
    ./services/keymap-de.nix
    ./services/pipewire.nix
    ./services/xserver.nix
    ./services/sddm.nix
    ./services/plasma6.nix
    ./services/gnome-keyring.nix
    ./services/tailscale.nix
    ./services/printing.nix
    ./services/trezord.nix
    ./services/mullvad-vpn.nix

    # fonts
    ./fonts/nerdfonts.nix
    ./fonts/nunito.nix

    # nix
    ./nix/garbage-collection.nix
    ./nix/experimental-features.nix

    # misc
    ./misc/defaultLocale.nix
    ./misc/console.nix

  ];
}
