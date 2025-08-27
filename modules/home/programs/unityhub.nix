{ pkgs, lib, ... }: {

  home.packages = [ pkgs.unityhub ];

  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "libxml2-2.13.8"
    ];
  };
}