{ ... }: {

  fileSystems."/home/WiredDesdpy/windows-boot-drive" =
    { device = "/dev/disk/by-uuid/FEB4741DB473D71D";
      fsType = "ntfs";
      options = [ "uid=1000" "gid=100" "nofail" ];
    };

  fileSystems."/home/WiredDesdpy/SSD-1TB" =
    { device = "/dev/disk/by-uuid/90ad11e4-dbee-477e-b24a-e9ec4c831190";
      fsType = "ext4";
      options = [ "nofail" ];
    };

  fileSystems."/home/WiredDesdpy/HDD-1TB" =
    { device = "/dev/disk/by-uuid/44BEE514BEE4FF74";
      fsType = "ntfs";
      options = [ "uid=1000" "gid=100" "nofail" ];
    };

}