{ ... }: {

  services.wivrn = {
    enable = true;
    openFirewall = true;

    # Write information to /etc/xdg/openxr/1/active_runtime.json, VR applications
    # will automatically read this and work with WiVRn (Note: This does not currently
    # apply for games run in Valve's Proton)
    defaultRuntime = true;

    # Run WiVRn as a systemd service on startup
    # autoStart = true;

    /* package = (pkgs.monado.overrideAttrs {
        pname = "monado-pimax"; # optional but helps distinguishing between packages

        src = pkgs.fetchFromGitLab {
            domain = "gitlab.freedesktop.org";
            owner = "Coreforge";
            repo = "monado";
            rev = "f858ee5dd8ca7696bd9219e8278f2671df56fe6e";
            hash = "sha256-Si56yvG+oSfyUaPAlF1FgB7WJo8td1xuVxYnkJvbu4o=";
        };
    }); */

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

  environment.systemPackages = [
    pkgs.wlx-overlay-s
  ];
}