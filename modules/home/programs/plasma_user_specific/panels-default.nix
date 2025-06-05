{ ... }: {

  # Panels
  programs.plasma.panels = [
    {
      alignment = "right";
      lengthMode = "custom";
      maxLength = 1000;
      minLength = 0;
      offset = 50;
      floating = true;
      height = 34;
      hiding = "dodgewindows";
      location = "top";
      widgets = [
        "org.kde.plasma.systemtray"
      ];
      screen = "all";
    }
    {
      alignment = "left";
      lengthMode = "fit";
      floating = true;
      height = 34;
      hiding = "dodgewindows";
      location = "top";
      widgets = [
        "org.kde.plasma.kickoff"
      ];
      screen = "all";
    }
    {
      alignment = "left";
      lengthMode = "custom";
      maxLength = 1000;
      minLength = 0;
      offset = 50;
      floating = true;
      height = 34;
      hiding = "dodgewindows";
      location = "top";
      widgets = [
        "org.kde.plasma.pager"
      ];
      screen = "all";
    }
    {
      alignment = "left";
      lengthMode = "custom";
      maxLength = 1000;
      minLength = 0;
      offset = 120;
      floating = true;
      height = 34;
      hiding = "dodgewindows";
      location = "top";
      widgets = [
        "org.kde.plasma.windowlist"
      ];
      screen = "all";
    }
    {
      alignment = "center";
      lengthMode = "fit";
      floating = true;
      height = 34;
      hiding = "dodgewindows";
      location = "top";
      widgets = [
        "org.kde.plasma.digitalclock"
      ];
      screen = "all";
    }
    {
      alignment = "left";
      lengthMode = "custom";
      maxLength = 1000;
      minLength = 0;
      offset = 1000;
      floating = true;
      height = 34;
      hiding = "dodgewindows";
      location = "top";
      widgets = [
        "org.kde.plasma.mediacontroller"
      ];
      screen = 1;
    }
    {
      alignment = "right";
      lengthMode = "fit";
      floating = true;
      height = 34;
      hiding = "dodgewindows";
      location = "top";
      widgets = [
        {
          name = "org.kde.plasma.lock_logout";
          config = {
            # /nix/store/*/share/plasma/plasmoids/org.kde.plasma.lock_logout/contents/config
            General = {
              "show_requestLogout" = false;
              "show_lockScreen" = false;
              "show_requestShutDown" = false;
              "show_requestReboot" = false;
              "show_requestLogoutScreen" = true;
              "show_suspendToDisk" = false;
            };
          };
        }
      ];
      screen = "all";
    }
  ];
}