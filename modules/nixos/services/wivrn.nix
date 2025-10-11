{ pkgs, lib, ... }: {

  services.wivrn = {
    enable = true;
    openFirewall = true;

    # Write information to /etc/xdg/openxr/1/active_runtime.json, VR applications
    # will automatically read this and work with WiVRn (Note: This does not currently
    # apply for games run in Valve's Proton)
    defaultRuntime = true;

    # Run WiVRn as a systemd service on startup
    # autoStart = true;

    package = pkgs.wivrn.overrideAttrs (old: rec {  
      version = "bdac7cafae07e8b7d9bd3a001bd81b81d63296e3";
      src = pkgs.fetchFromGitHub {
        owner = "notpeelz";
        repo = "WiVRn";
        rev = version;
        # This will throw an error when evaluating and give you the correct hash - put that here
        hash = "sha256-Xc2vPgYSSdtCfocNztQFyEkCH78FcFvxDeFc4KSWSLA=";
      };
      cmakeFlags = old.cmakeFlags ++ [
        (lib.cmakeBool "WIVRN_FEATURE_SOLARXR" true)
      ];
    });

    # Config for WiVRn (https://github.com/WiVRn/WiVRn/blob/master/docs/configuration.md)
    config = {
      enable = true;
      json = {
        # 1.0x foveation scaling
        scale = 1.0;
        # 100 Mb/s
        bitrate = 100000000;
        encoders = [
          {
          encoder = "vaapi";
          codec = "h265";
          # 1.0 x 1.0 scaling
          width = 1.0;
          height = 1.0;
          offset_x = 0.0;
          offset_y = 0.0;
          }
        ]; 
      };
    };
  }; 

  environment.sessionVariables = lib.mkAfter {
    WEBKIT_DISABLE_DMABUF_RENDERER = "1";
  };

  services.udev.extraRules = ''
      SUBSYSTEM=="usb", ATTR{idVendor}=="1209", ATTR{idProduct}=="7690", MODE="0666"
      KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="1209", ATTRS{idProduct}=="7690", MODE="0666"
  '';

  environment.systemPackages = [
    pkgs.wlx-overlay-s
    pkgs.slimevr
  ];
}