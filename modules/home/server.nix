{ ... }: {
  imports = [

    # programs
    ../modules/home/programs/home-manager.nix   # Needed to us home manager!
    ../modules/home/programs/git.nix

  ];
}