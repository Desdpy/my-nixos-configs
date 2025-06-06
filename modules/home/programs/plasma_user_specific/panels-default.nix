{ ... }: {

  # Panels
    programs.plasma.panels = [
      {
        alignment = "left";
        lengthMode = "fit";
        floating = true;
        height = 34;
        hiding = "dodgewindows";
        location = "top";
        widgets = [
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.kickoff"
        ];
        screen = "all";
      }
      {
        alignment = "left";
        lengthMode = "custom";
        maxLength = 1000;
        minLength = 0;
        offset = 52;
        floating = true;
        height = 34;
        hiding = "dodgewindows";
        location = "top";
        widgets = [
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.pager"
        ];
        screen = "all";
      }
      {
        alignment = "left";
        lengthMode = "custom";
        maxLength = 1000;
        minLength = 0;
        offset = 122;
        floating = true;
        height = 34;
        hiding = "dodgewindows";
        location = "top";
        widgets = [
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.mediacontroller"
        ];
        screen = "all";
      }
      /* {
        alignment = "right";
        lengthMode = "custom";
        maxLength = 1000;
        minLength = 0;
        offset = 1057;
        floating = true;
        height = 34;
        hiding = "dodgewindows";
        location = "top";
        widgets = [
          "org.kde.plasma.weather"
        ];
        screen = 1;
      } */
      {
        alignment = "center";
        lengthMode = "fit";
        floating = true;
        height = 34;
        hiding = "dodgewindows";
        location = "top";
        widgets = [
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.systemmonitor.cpu"
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.systemmonitor.cpucore"
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.systemmonitor.memory"
        ];
        screen = "all";
      }
      /* {
        alignment = "left";
        lengthMode = "custom";
        maxLength = 1000;
        minLength = 0;
        offset = 1057;
        floating = true;
        height = 34;
        hiding = "dodgewindows";
        location = "top";
        widgets = [
          "org.kde.plasma.windowlist"
        ];
        screen = 1;
      } */
      {
        alignment = "right";
        lengthMode = "custom";
        maxLength = 1000;
        minLength = 0;
        offset = 84;
        floating = true;
        height = 34;
        hiding = "dodgewindows";
        location = "top";
        widgets = [
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.systemtray"
        ];
        screen = "all";
      }
      {
        alignment = "right";
        lengthMode = "fit";
        floating = true;
        height = 34;
        hiding = "dodgewindows";
        location = "top";
        widgets = [
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.digitalclock"
        ];
        screen = "all";
      }
    ];
}