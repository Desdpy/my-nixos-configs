{ pkgs, ... }: {

  fonts.packages = with pkgs; [
    nerd-fonts._0xproto
    texlivePackages.nunito
    # texlivePackages.fontawesome
    # roboto
  ];
}