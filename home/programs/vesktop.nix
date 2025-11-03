{ pkgs, ... }: {

  programs.vesktop = {
    enable = true;
    vencord.settings.enabledThemes = [ "frappe.theme.css" ];
  };

  # Add themes
  home.file.".config/vesktop/themes" = {
    source = ../file/dotfiles/vesktop/themes;
    recursive = true;
  };
}
