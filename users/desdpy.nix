{ config, pkgs, ... }: {
  imports = [
    ../modules/home/programs/home-manager.nix   # Needed to us home manager!
    ../modules/home/default.nix
    ../modules/home/virtual-machines.nix
  ];

  home = {
    # Home Manager needs a bit of information about you and the paths it should
    # manage.
    username = "desdpy";
    homeDirectory = "/home/desdpy";

    # This value determines the Home Manager release that your configuration is
    # compatible with. This helps avoid breakage when a new Home Manager release
    # introduces backwards incompatible changes.
    #
    # You should not change this value, even if you update Home Manager. If you do
    # want to update the value, then make sure to first check the Home Manager
    # release notes.
    stateVersion = "24.05"; # Please read the comment before changing.
  };
}
