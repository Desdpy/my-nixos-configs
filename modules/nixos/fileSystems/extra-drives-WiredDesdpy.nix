{ ... }: {

  fileSystems."/home/WiredDesdpy/windows-boot-drive" =
    { device = "/dev/disk/by-uuid/FEB4741DB473D71D";
      fsType = "ntfs";
      options = [ "uid=1000" "gid=100" "nofail" ];
    };

  fileSystems."/home/WiredDesdpy/SSD-1TB" =
    { device = "/dev/disk/by-uuid/0567E72767CB2293";
      fsType = "ntfs";
      options = [ "uid=1000" "gid=100" "nofail" ];
    };

  fileSystems."/home/WiredDesdpy/HDD-1TB" =
    { device = "/dev/disk/by-uuid/44BEE514BEE4FF74";
      fsType = "ntfs";
      options = [ "uid=1000" "gid=100" "nofail" ];
    };

}