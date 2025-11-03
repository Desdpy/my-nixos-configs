{ ... }: {

  imports = [

    # Use with nix/virtual-machines.nix
    
    # programs
    ./programs/virt-manager.nix
    ./programs/virt-viewer.nix
    ./programs/win-virtio.nix
    ./programs/spice.nix

  ];
}