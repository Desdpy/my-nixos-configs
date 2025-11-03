# Home Manager is pretty good at managing dotfiles. The primary way to manage
# plain files is through 'home.file'.
file = {
  # Building this configuration will create a copy of 'dotfiles/screenrc' in
  # the Nix store. Activating the configuration will then make '~/.screenrc' a
  # symlink to the Nix store copy.
  # ".screenrc".source = dotfiles/screenrc;

  # Symlink dot files
  # file.".config/alacritty/alacritty.toml".source = ./dots/alacritty/alacritty.toml;
  # file.".config/hypr/hyprland.conf".source = ./dots/hyprland/hyprland.conf;

  # You can also set the file content immediately.
  # ".gradle/gradle.properties".text = ''
  #   org.gradle.console=verbose
  #   org.gradle.daemon.idletimeout=3600000
  # '';
};
