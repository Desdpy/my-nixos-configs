{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    virt-manager
    virt-viewer
    win-virtio
    spice
    spice-gtk
    spice-protocol
    win-spice
  ];

  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        swtpm.enable = true;
        ovmf.enable = true;
        ovmf.packages = with pkgs; [ OVMFFull.fd ];
        vhostUserPackages = with pkgs; [ virtiofsd ];
      };
    };
    spiceUSBRedirection.enable = true;
  };
}