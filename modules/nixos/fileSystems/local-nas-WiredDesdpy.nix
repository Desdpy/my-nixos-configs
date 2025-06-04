{ ... }: {

  fileSystems."/home/WiredDesdpy/smb" =
    { device = "//192.168.1.198/bilder_und_videos";
      fsType = "cifs";
      options = [ "credentials=/home/WiredDesdpy/.smbcredentials" "uid=1000" "gid=100" "nofail" ];
    };
}