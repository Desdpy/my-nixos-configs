{ pkgs, ... }: {

  programs.waybar = {
    enable = true;
  };

  # Config files
  home.file.".config/waybar/config.jsonc".source = ../file/dotfiles/waybar/config.jsonc;
  home.file.".config/waybar/launch-waybar.sh".source = ../file/dotfiles/waybar/launch-waybar.sh;
  home.file.".config/waybar/style.css".source = ../file/dotfiles/waybar/style.css;
}