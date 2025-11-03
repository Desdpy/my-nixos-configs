{ pkgs, ... }: {

  home.packages = [ pkgs.foot ];

  # Config Files
  home.file.".config/foot/foot.ini".source = ../file/dotfiles/foot/foot.ini;
}
