{ ... }: {

  virtualisation.docker = {
    enable = true;
    storageDriver = "btrfs";
  };

  # Don't forget to add user to "docker group"

}