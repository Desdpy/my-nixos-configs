{ pkgs, lib, ... }: {

  programs.plasma = {
    enable = true;
    overrideConfig = true;

    workspace = {

      # Appearance & Style -> Colors & Themes -> Global Theme
      # (plasma-apply-lookandfeel --list)
      lookAndFeel = "Catppuccin-Frappe-Blue";

      # Appearance & Style -> Wallpaper
      wallpaper = ../../../wallpapers/catppuccin_walls/wallpapers_png/whoami.png;

    };

    # Input & Output -> Mouse & Touchpad -> Touchpad
    input.touchpads = [
      {
        # Thinkpad T14 Gen 1
        enable = true;
        name = "SynPS/2 Synaptics TouchPad";
        vendorId = "0002";
        productId = "0007";
        
        # accelerationProfile = "none";
        disableWhileTyping = true;
        leftHanded = true;
        middleButtonEmulation = true;
        pointerSpeed = 0;
        naturalScroll = true;
        tapToClick = true;
      }
    ];

    # System -> Autostart
    startup.startupScript."autostart" = {
      text = ''
        protonvpn-app &
        protonmail-bridge-gui --no-window &
      '';
      runAlways = true;
    };

    # Input & Output -> Keyboard -> Shortcuts
    shortcuts = {
      kwin = {
        "KrohnkiteTileLayout" = [ ]; # Default: Meta+T
        "Edit Tiles" = [ ]; # Default : Meta+T
        "Window Close" = [
          "Alt+F4"
          "Meta+Shift+Q"
        ]; # Default = Alt+F4
        "Switch to Desktop 1" = "Meta+1"; # Default: Ctrl+F1
        "Switch to Desktop 2" = "Meta+2"; # Default: Ctrl+F2
        "Switch to Desktop 3" = "Meta+3"; # Default: Ctrl+F3
        "Switch to Desktop 4" = "Meta+4"; # Default: Ctrl+F4
        "Switch to Desktop 5" = "Meta+5"; # Default: Ctrl+F5
        "Switch to Desktop 6" = "Meta+6"; # Default: Ctrl+F6
        "Switch to Desktop 7" = "Meta+7"; # Default: Ctrl+F7
        "Switch to Desktop 8" = "Meta+8"; # Default: Ctrl+F8
        "Switch to Desktop 9" = "Meta+9"; # Default: Ctrl+F9
        "Window to Desktop 1" = "Meta+!"; # Default: Meta+Ctrl+1
        "Window to Desktop 2" = "Meta+\""; # Default: Meta+Ctrl+2
        "Window to Desktop 3" = "Meta+§"; # Default: Meta+Ctrl+3
        "Window to Desktop 4" = "Meta+$"; # Default: Meta+Ctrl+4
        "Window to Desktop 5" = "Meta+%"; # Default: Meta+Ctrl+5
        "Window to Desktop 6" = "Meta+&"; # Default: Meta+Ctrl+6
        "Window to Desktop 7" = "Meta+/"; # Default: Meta+Ctrl+7
        "Window to Desktop 8" = "Meta+("; # Default: Meta+Ctrl+8
        "Window to Desktop 9" = "Meta+)"; # Default: Meta+Ctrl+9
        "Window Quick Tile Bottom" = [ ]; # Default: Meta+Down
        "Window Quick Tile Top" = [ ]; # Default: Meta+Up
        "Window Quick Tile Left" = [ ]; # Default: Meta+Left
        "Window Quick Tile Right" = [ ]; # Default: Meta+Right
        "Switch One Desktop Down" = "Meta+Down"; # Default: Meta+Ctrl+Down
        "Switch One Desktop Up" = "Meta+Up"; # Default: Meta+Ctrl+Up
        "Switch One Desktop to the Left" = "Meta+Left"; # Default: Meta+Ctrl+Left
        "Switch One Desktop to the Right" = "Meta+Right"; # Default: Meta+Ctrl+Right
        "Window One Desktop Down" = "Meta+Shift+Down"; # Default: Meta+Ctrl+Shift+Down
        "Window One Desktop Up" = "Meta+Shift+Up"; # Default: Meta+Ctrl+Shift+Up
        "Window One Desktop to the Left" = "Meta+Shift+Left"; # Default: Meta+Ctrl+Shift+Left
        "Window One Desktop to the Right" = "Meta+Shift+Right"; # Default: Meta+Ctrl+Shift+Right
        "MoveMouseToFocus" = "Meta+Alt+PgDown"; # Default: Meta+F5
        "Window to Next Screen" = [ ]; #Default: Meta+Shift+Right
        "Window to Previous Screen" = [ ]; # Default: Meta+Shift+Left
        # "KrohnkiteFocusRight" = ",none,Krohnkite: Focus Right"; Default 
        /* "Switch Window Down" = [ ]; # Default: Meta+Alt+Down
        "Switch Window Left" = [ ]; # Default: Meta+Alt+Left
        "Switch Window Right" = [ ]; # Default: Meta+Alt+Right
        "Switch Window Up" = [ ]; # Default: Meta+Alt+Up */
      };
      ksmserver = {
        "Lock Session" = "Screensaver"; # Default: Meta+L, Screensaver
      };
      plasmashell = {
        "activate task manager entry 1" = [ ]; # Default: Meta+1
        "activate task manager entry 2" = [ ]; # Default: Meta+2
        "activate task manager entry 3" = [ ]; # Default: Meta+3
        "activate task manager entry 4" = [ ]; # Default: Meta+4
        "activate task manager entry 5" = [ ]; # Default: Meta+5
        "activate task manager entry 6" = [ ]; # Default: Meta+6
        "activate task manager entry 7" = [ ]; # Default: Meta+7
        "activate task manager entry 8" = [ ]; # Default: Meta+8
        "activate task manager entry 9" = [ ]; # Default: Meta+9
      };

      # Input & Output -> Keyboard -> Shortcuts -> Add New
      "services/foot.desktop"."_launch" = "Meta+T";
    };

    # System -> Session -> Desdktop Session
    session.sessionRestore.restoreOpenApplicationsOnLogin = "startWithEmptySession";

    # Input & Output -> Keyboard -> Shortcuts -> Add New
    /* hotkeys.commands = {
      "switch-window-down" = {
        name = "Switch Window Down";
        key = "Meta+Alt+Down";
        command = "bash ${./plasma_helpers/switch_window.sh} Down";
      };
      "switch-window-up" = {
        name = "Switch Window Up";
        key = "Meta+Alt+Up";
        command = "bash ${./plasma_helpers/switch_window.sh} Up";
      };
      "switch-window-left" = {
        name = "Switch Window Left";
        key = "Meta+Alt+Left";
        command = "bash ${./plasma_helpers/switch_window.sh} Left";
      };
      "switch-window-right" = {
        name = "Switch Window Right";
        key = "Meta+Alt+Right";
        command = "bash ${./plasma_helpers/switch_window.sh} Right";
      };
    }; */

    # Apps & Windows -> Window Management -> Virtual Desktops
    kwin.virtualDesktops = {
      number = 9;
      rows = 3;
    };

    # Panels
    panels = [
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
          "org.kde.plasma.pager"
        ];
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
      }
      {
        alignment = "right";
        lengthMode = "fit";
        floating = true;
        height = 34;
        hiding = "dodgewindows";
        location = "top";
        widgets = [
          "org.kde.plasma.systemtray"
        ];
      }
    ];

    # Security & Privacy -> Screen Locking
    kscreenlocker = {
      lockOnResume = true;
      timeout = 15;
      appearance.wallpaper = ../../../wallpapers/catppuccin_walls/wallpapers_png/whoami_blured.png;
    };

    # Apps & Windows -> Window Management -> Window Rules
    window-rules = [
      {
        description = "Set minimum geometry size";
        match = {
          window-types = [ "normal" ];
        };
        apply = {
          minsize = {
            apply = "force";
            value = "0,0";
          };
        };
      }
      {
        description = "Disable decorations";
        match = {
          window-types = [ "normal" ];
        };
        apply = {
          noborder = {
            value = true;
            apply = "force";
          };
        };
      }
    ];

    configFile = {

      # Apps & Windows -> Window Management -> Window Behavior
      "kwinrc"."Windows"."FocusPolicy" = "FocusFollowsMouse";
      "kwinrc"."Windows"."NextFocusPrefersMouse" = true;
      "kwinrc"."Windows"."DelayFocusInterval" = 0;

      # Apps & Windows -> Window Management -> KWin Scripts -> Krohnkite
      "kwinrc"."Plugins"."krohnkiteEnabled" = true;
      "kwinrc"."Script-krohnkite"."screenGapBottom" = 8;
      "kwinrc"."Script-krohnkite"."screenGapLeft" = 8;
      "kwinrc"."Script-krohnkite"."screenGapRight" = 8;
      "kwinrc"."Script-krohnkite"."screenGapTop" = 50;
      "kwinrc"."Script-krohnkite"."tileLayoutGap" = 8;

      # Apps & Windows -> Window Management -> Desdktop Effects -> Geometry Change
      "kwinrc"."Plugins"."kwin4_effect_geometry_changeEnabled" = true;

      # Apps & Windows -> Window Management -> Desdktop Effects -> Rounded Corners
      "kwinrc"."Round-Corners"."InactiveOutlineColor" = "48,52,70";
      "kwinrc"."Round-Corners"."InactiveOutlineThickness" = 2.5;
      "kwinrc"."Round-Corners"."InactiveSecondOutlineColor" = "29,29,45";
      "kwinrc"."Round-Corners"."InactiveSecondOutlineThickness" = 4.25;
      "kwinrc"."Round-Corners"."OutlineColor" = "221,161,201";
      "kwinrc"."Round-Corners"."OutlineThickness" = 2.5;
      "kwinrc"."Round-Corners"."SecondOutlineColor" = "29,29,44";
      "kwinrc"."Round-Corners"."SecondOutlineThickness" = 4.25;

      # Apps & Windows -> Default Applications -> Default Applications
      "kdeglobals"."General"."TerminalApplication" = "foot";
      "kdeglobals"."General"."TerminalService" = "foot.desktop";

      # Disable browser integration reminder
      "kded5rc"."Module-browserintegrationreminder"."autoload" = false;
      
    };

    /* workspace = {
      clickItemTo = "open"; # If you liked the click-to-open default from plasma 5
      lookAndFeel = "org.kde.breezedark.desktop";
      cursor = {
        theme = "Bibata-Modern-Ice";
        size = 32;
      };
      iconTheme = "Papirus-Dark";
      wallpaper = ../../../wallpapers/catzz-Girl_drinking.jpg;
    }; */

    /* hotkeys.commands."launch-konsole" = {
      name = "Launch Konsole";
      key = "Meta+Alt+K";
      command = "konsole";
    };

    fonts = {
      general = {
        family = "JetBrains Mono";
        pointSize = 12;
      };
    };

    desktop.widgets = [
      {
        plasmusicToolbar = {
          position = {
            horizontal = 51;
            vertical = 100;
          };
          size = {
            width = 250;
            height = 250;
          };
        };
      }
    ];

    panels = [
      # Windows-like panel at the bottom
      {
        location = "bottom";
        widgets = [
          # We can configure the widgets by adding the name and config
          # attributes. For example to add the the kickoff widget and set the
          # icon to "nix-snowflake-white" use the below configuration. This will
          # add the "icon" key to the "General" group for the widget in
          # ~/.config/plasma-org.kde.plasma.desktop-appletsrc.
          {
            name = "org.kde.plasma.kickoff";
            config = {
              General = {
                icon = "nix-snowflake-white";
                alphaSort = true;
              };
            };
          }
          # Or you can configure the widgets by adding the widget-specific options for it.
          # See modules/widgets for supported widgets and options for these widgets.
          # For example:
          {
            kickoff = {
              sortAlphabetically = true;
              icon = "nix-snowflake-white";
            };
          }
          # Adding configuration to the widgets can also for example be used to
          # pin apps to the task-manager, which this example illustrates by
          # pinning dolphin and konsole to the task-manager by default with widget-specific options.
          {
            iconTasks = {
              launchers = [
                "applications:org.kde.dolphin.desktop"
                "applications:org.kde.konsole.desktop"
              ];
            };
          }
          # Or you can do it manually, for example:
          {
            name = "org.kde.plasma.icontasks";
            config = {
              General = {
                launchers = [
                  "applications:org.kde.dolphin.desktop"
                  "applications:org.kde.konsole.desktop"
                ];
              };
            };
          }
          # If no configuration is needed, specifying only the name of the
          # widget will add them with the default configuration.
          "org.kde.plasma.marginsseparator"
          # If you need configuration for your widget, instead of specifying the
          # the keys and values directly using the config attribute as shown
          # above, plasma-manager also provides some higher-level interfaces for
          # configuring the widgets. See modules/widgets for supported widgets
          # and options for these widgets. The widgets below shows two examples
          # of usage, one where we add a digital clock, setting 12h time and
          # first day of the week to Sunday and another adding a systray with
          # some modifications in which entries to show.
          {
            digitalClock = {
              calendar.firstDayOfWeek = "sunday";
              time.format = "12h";
            };
          }
          {
            systemTray.items = {
              # We explicitly show bluetooth and battery
              shown = [
                "org.kde.plasma.battery"
                "org.kde.plasma.bluetooth"
              ];
              # And explicitly hide networkmanagement and volume
              hidden = [
                "org.kde.plasma.networkmanagement"
                "org.kde.plasma.volume"
              ];
            };
          }
        ];
        hiding = "autohide";
      }
      # Application name, Global menu and Song information and playback controls at the top
      {
        location = "top";
        height = 26;
        widgets = [
          {
            applicationTitleBar = {
              behavior = {
                activeTaskSource = "activeTask";
              };
              layout = {
                elements = [ "windowTitle" ];
                horizontalAlignment = "left";
                showDisabledElements = "deactivated";
                verticalAlignment = "center";
              };
              overrideForMaximized.enable = false;
              titleReplacements = [
                {
                  type = "regexp";
                  originalTitle = "^Brave Web Browser$";
                  newTitle = "Brave";
                }
                {
                  type = "regexp";
                  originalTitle = ''\\bDolphin\\b'';
                  newTitle = "File manager";
                }
              ];
              windowTitle = {
                font = {
                  bold = false;
                  fit = "fixedSize";
                  size = 12;
                };
                hideEmptyTitle = true;
                margins = {
                  bottom = 0;
                  left = 10;
                  right = 5;
                  top = 0;
                };
                source = "appName";
              };
            };
          }
          "org.kde.plasma.appmenu"
          "org.kde.plasma.panelspacer"
          {
            plasmusicToolbar = {
              panelIcon = {
                albumCover = {
                  useAsIcon = false;
                  radius = 8;
                };
                icon = "view-media-track";
              };
              playbackSource = "auto";
              musicControls.showPlaybackControls = true;
              songText = {
                displayInSeparateLines = true;
                maximumWidth = 640;
                scrolling = {
                  behavior = "alwaysScroll";
                  speed = 3;
                };
              };
            };
          }
        ];
      }
    ];

    window-rules = [
      {
        description = "Dolphin";
        match = {
          window-class = {
            value = "dolphin";
            type = "substring";
          };
          window-types = [ "normal" ];
        };
        apply = {
          noborder = {
            value = true;
            apply = "force";
          };
          # `apply` defaults to "apply-initially"
          maximizehoriz = true;
          maximizevert = true;
        };
      }
    ];

    powerdevil = {
      AC = {
        powerButtonAction = "lockScreen";
        autoSuspend = {
          action = "shutDown";
          idleTimeout = 1000;
        };
        turnOffDisplay = {
          idleTimeout = 1000;
          idleTimeoutWhenLocked = "immediately";
        };
      };
      battery = {
        powerButtonAction = "sleep";
        whenSleepingEnter = "standbyThenHibernate";
      };
      lowBattery = {
        whenLaptopLidClosed = "hibernate";
      };
    };

    kwin = {
      edgeBarrier = 0; # Disables the edge-barriers introduced in plasma 6.1
      cornerBarrier = false;

      scripts.polonium.enable = true;
    };

     */

    #
    # Some mid-level settings:
    #
    /* shortcuts = {
      ksmserver = {
        "Lock Session" = [
          "Screensaver"
          "Meta+Ctrl+Alt+L"
        ];
      };

      kwin = {
        "Expose" = "Meta+,";
        "Switch Window Down" = "Meta+J";
        "Switch Window Left" = "Meta+H";
        "Switch Window Right" = "Meta+L";
        "Switch Window Up" = "Meta+K";
      };
    }; */

    #
    # Some low-level settings:
    #
    /* configFile = {
      baloofilerc."Basic Settings"."Indexing-Enabled" = false;
      kwinrc."org.kde.kdecoration2".ButtonsOnLeft = "SF";
      kwinrc.Desktops.Number = {
        value = 8;
        # Forces kde to not change this value (even through the settings app).
        immutable = true;
      };
      kscreenlockerrc = {
        Greeter.WallpaperPlugin = "org.kde.potd";
        # To use nested groups use / as a separator. In the below example,
        # Provider will be added to [Greeter][Wallpaper][org.kde.potd][General].
        "Greeter/Wallpaper/org.kde.potd/General".Provider = "bing";
      };
    }; */
  };

  # Manually add plugins
  home.file.".local/share/kwin/effects" = {
    source = ./plasma_extra_packages/geometry_change;
    recursive = true;
  };

  /* {
    programs.plasma = {
      enable = true;
      shortcuts = {
        "ActivityManager"."switch-to-activity-28b509db-3f16-47c5-8840-76ea60eeac75" = [ ];
        "KDE Keyboard Layout Switcher"."Switch to Last-Used Keyboard Layout" = "Meta+Alt+L";
        "KDE Keyboard Layout Switcher"."Switch to Next Keyboard Layout" = "Meta+Alt+K";
        "kaccess"."Toggle Screen Reader On and Off" = "Meta+Alt+S";
        "kcm_touchpad"."Disable Touchpad" = "Touchpad Off";
        "kcm_touchpad"."Enable Touchpad" = "Touchpad On";
        "kcm_touchpad"."Toggle Touchpad" = ["Touchpad Toggle" "Meta+Ctrl+Touchpad Toggle" "Meta+Ctrl+Zenkaku Hankaku,Touchpad Toggle" "Touchpad Toggle" "Meta+Ctrl+Touchpad Toggle" "Meta+Ctrl+Zenkaku Hankaku"];
        "kmix"."decrease_microphone_volume" = "Microphone Volume Down";
        "kmix"."decrease_volume" = "Volume Down";
        "kmix"."decrease_volume_small" = "Shift+Volume Down";
        "kmix"."increase_microphone_volume" = "Microphone Volume Up";
        "kmix"."increase_volume" = "Volume Up";
        "kmix"."increase_volume_small" = "Shift+Volume Up";
        "kmix"."mic_mute" = ["Microphone Mute" "Meta+Volume Mute,Microphone Mute" "Meta+Volume Mute,Mute Microphone"];
        "kmix"."mute" = "Volume Mute";
        "ksmserver"."Halt Without Confirmation" = "none,,Shut Down Without Confirmation";
        "ksmserver"."Lock Session" = ["Meta+L" "Screensaver,Meta+L" "Screensaver,Lock Session"];
        "ksmserver"."Log Out" = "Ctrl+Alt+Del";
        "ksmserver"."Log Out Without Confirmation" = "none,,Log Out Without Confirmation";
        "ksmserver"."LogOut" = "none,,Log Out";
        "ksmserver"."Reboot" = "none,,Reboot";
        "ksmserver"."Reboot Without Confirmation" = "none,,Reboot Without Confirmation";
        "ksmserver"."Shut Down" = "none,,Shut Down";
        "kwin"."Activate Window Demanding Attention" = "Meta+Ctrl+A";
        "kwin"."Cycle Overview" = [ ];
        "kwin"."Cycle Overview Opposite" = [ ];
        "kwin"."Decrease Opacity" = "none,,Decrease Opacity of Active Window by 5%";
        "kwin"."Edit Tiles" = "Meta+T";
        "kwin"."Expose" = "Ctrl+F9";
        "kwin"."ExposeAll" = ["Ctrl+F10" "Launch (C),Ctrl+F10" "Launch (C),Toggle Present Windows (All desktops)"];
        "kwin"."ExposeClass" = "Ctrl+F7";
        "kwin"."ExposeClassCurrentDesktop" = [ ];
        "kwin"."Grid View" = "Meta+G";
        "kwin"."Increase Opacity" = "none,,Increase Opacity of Active Window by 5%";
        "kwin"."Kill Window" = "Meta+Ctrl+Esc";
        "kwin"."KrohnkiteBTreeLayout" = [ ];
        "kwin"."KrohnkiteColumnsLayout" = [ ];
        "kwin"."KrohnkiteDecrease" = [ ];
        "kwin"."KrohnkiteFloatAll" = "Meta+Shift+F,none,Krohnkite: Toggle Float All";
        "kwin"."KrohnkiteFloatingLayout" = [ ];
        "kwin"."KrohnkiteFocusDown" = "Meta+J,none,Krohnkite: Focus Down";
        "kwin"."KrohnkiteFocusLeft" = "Meta+H,none,Krohnkite: Focus Left";
        "kwin"."KrohnkiteFocusNext" = [ ];
        "kwin"."KrohnkiteFocusPrev" = "Meta+\\,,none,Krohnkite: Focus Previous";
        "kwin"."KrohnkiteFocusRight" = [ ];
        "kwin"."KrohnkiteFocusUp" = "Meta+K,none,Krohnkite: Focus Up";
        "kwin"."KrohnkiteGrowHeight" = "Meta+Ctrl+J,none,Krohnkite: Grow Height";
        "kwin"."KrohnkiteIncrease" = "Meta+I,none,Krohnkite: Increase";
        "kwin"."KrohnkiteMonocleLayout" = "Meta+M,none,Krohnkite: Monocle Layout";
        "kwin"."KrohnkiteNextLayout" = "Meta+\\\\,none,Krohnkite: Next Layout";
        "kwin"."KrohnkitePreviousLayout" = "Meta+|,none,Krohnkite: Previous Layout";
        "kwin"."KrohnkiteQuarterLayout" = [ ];
        "kwin"."KrohnkiteRotate" = [ ];
        "kwin"."KrohnkiteRotatePart" = [ ];
        "kwin"."KrohnkiteSetMaster" = "Meta+Return,none,Krohnkite: Set master";
        "kwin"."KrohnkiteShiftDown" = "Meta+Shift+J,none,Krohnkite: Move Down/Next";
        "kwin"."KrohnkiteShiftLeft" = "Meta+Shift+H,none,Krohnkite: Move Left";
        "kwin"."KrohnkiteShiftRight" = "Meta+Shift+L,none,Krohnkite: Move Right";
        "kwin"."KrohnkiteShiftUp" = "Meta+Shift+K,none,Krohnkite: Move Up/Prev";
        "kwin"."KrohnkiteShrinkHeight" = "Meta+Ctrl+K,none,Krohnkite: Shrink Height";
        "kwin"."KrohnkiteShrinkWidth" = "Meta+Ctrl+H,none,Krohnkite: Shrink Width";
        "kwin"."KrohnkiteSpiralLayout" = [ ];
        "kwin"."KrohnkiteSpreadLayout" = [ ];
        "kwin"."KrohnkiteStackedLayout" = [ ];
        "kwin"."KrohnkiteStairLayout" = [ ];
        "kwin"."KrohnkiteTileLayout" = [ ];
        "kwin"."KrohnkiteToggleFloat" = "Meta+F,none,Krohnkite: Toggle Float";
        "kwin"."KrohnkiteTreeColumnLayout" = [ ];
        "kwin"."KrohnkitegrowWidth" = "Meta+Ctrl+L,none,Krohnkite: Grow Width";
        "kwin"."KrohnkitetoggleDock" = [ ];
        "kwin"."Move Tablet to Next Output" = [ ];
        "kwin"."MoveMouseToCenter" = "Meta+F6";
        "kwin"."MoveMouseToFocus" = "Meta+F5";
        "kwin"."MoveZoomDown" = [ ];
        "kwin"."MoveZoomLeft" = [ ];
        "kwin"."MoveZoomRight" = [ ];
        "kwin"."MoveZoomUp" = [ ];
        "kwin"."Overview" = "Meta+W";
        "kwin"."Setup Window Shortcut" = "none,,Setup Window Shortcut";
        "kwin"."Show Desktop" = "Meta+D";
        "kwin"."Switch One Desktop Down" = "Meta+Ctrl+Down";
        "kwin"."Switch One Desktop Up" = "Meta+Ctrl+Up";
        "kwin"."Switch One Desktop to the Left" = "Meta+Ctrl+Left";
        "kwin"."Switch One Desktop to the Right" = "Meta+Ctrl+Right";
        "kwin"."Switch Window Down" = "Meta+Alt+Down";
        "kwin"."Switch Window Left" = "Meta+Alt+Left";
        "kwin"."Switch Window Right" = "Meta+Alt+Right";
        "kwin"."Switch Window Up" = "Meta+Alt+Up";
        "kwin"."Switch to Desktop 1" = "Ctrl+F1";
        "kwin"."Switch to Desktop 10" = "none,,Switch to Desktop 10";
        "kwin"."Switch to Desktop 11" = "none,,Switch to Desktop 11";
        "kwin"."Switch to Desktop 12" = "none,,Switch to Desktop 12";
        "kwin"."Switch to Desktop 13" = "none,,Switch to Desktop 13";
        "kwin"."Switch to Desktop 14" = "none,,Switch to Desktop 14";
        "kwin"."Switch to Desktop 15" = "none,,Switch to Desktop 15";
        "kwin"."Switch to Desktop 16" = "none,,Switch to Desktop 16";
        "kwin"."Switch to Desktop 17" = "none,,Switch to Desktop 17";
        "kwin"."Switch to Desktop 18" = "none,,Switch to Desktop 18";
        "kwin"."Switch to Desktop 19" = "none,,Switch to Desktop 19";
        "kwin"."Switch to Desktop 2" = "Ctrl+F2";
        "kwin"."Switch to Desktop 20" = "none,,Switch to Desktop 20";
        "kwin"."Switch to Desktop 3" = "Ctrl+F3";
        "kwin"."Switch to Desktop 4" = "Ctrl+F4";
        "kwin"."Switch to Desktop 5" = "none,,Switch to Desktop 5";
        "kwin"."Switch to Desktop 6" = "none,,Switch to Desktop 6";
        "kwin"."Switch to Desktop 7" = "none,,Switch to Desktop 7";
        "kwin"."Switch to Desktop 8" = "none,,Switch to Desktop 8";
        "kwin"."Switch to Desktop 9" = "none,,Switch to Desktop 9";
        "kwin"."Switch to Next Desktop" = "none,,Switch to Next Desktop";
        "kwin"."Switch to Next Screen" = "none,,Switch to Next Screen";
        "kwin"."Switch to Previous Desktop" = "none,,Switch to Previous Desktop";
        "kwin"."Switch to Previous Screen" = "none,,Switch to Previous Screen";
        "kwin"."Switch to Screen 0" = "none,,Switch to Screen 0";
        "kwin"."Switch to Screen 1" = "none,,Switch to Screen 1";
        "kwin"."Switch to Screen 2" = "none,,Switch to Screen 2";
        "kwin"."Switch to Screen 3" = "none,,Switch to Screen 3";
        "kwin"."Switch to Screen 4" = "none,,Switch to Screen 4";
        "kwin"."Switch to Screen 5" = "none,,Switch to Screen 5";
        "kwin"."Switch to Screen 6" = "none,,Switch to Screen 6";
        "kwin"."Switch to Screen 7" = "none,,Switch to Screen 7";
        "kwin"."Switch to Screen Above" = "none,,Switch to Screen Above";
        "kwin"."Switch to Screen Below" = "none,,Switch to Screen Below";
        "kwin"."Switch to Screen to the Left" = "none,,Switch to Screen to the Left";
        "kwin"."Switch to Screen to the Right" = "none,,Switch to Screen to the Right";
        "kwin"."Toggle Night Color" = [ ];
        "kwin"."Toggle Window Raise/Lower" = "none,,Toggle Window Raise/Lower";
        "kwin"."Walk Through Windows" = "Alt+Tab";
        "kwin"."Walk Through Windows (Reverse)" = "Alt+Shift+Tab";
        "kwin"."Walk Through Windows Alternative" = "none,,Walk Through Windows Alternative";
        "kwin"."Walk Through Windows Alternative (Reverse)" = "none,,Walk Through Windows Alternative (Reverse)";
        "kwin"."Walk Through Windows of Current Application" = "Alt+`";
        "kwin"."Walk Through Windows of Current Application (Reverse)" = "Alt+~";
        "kwin"."Walk Through Windows of Current Application Alternative" = "none,,Walk Through Windows of Current Application Alternative";
        "kwin"."Walk Through Windows of Current Application Alternative (Reverse)" = "none,,Walk Through Windows of Current Application Alternative (Reverse)";
        "kwin"."Window Above Other Windows" = "none,,Keep Window Above Others";
        "kwin"."Window Below Other Windows" = "none,,Keep Window Below Others";
        "kwin"."Window Close" = "Alt+F4";
        "kwin"."Window Custom Quick Tile Bottom" = "none,,Custom Quick Tile Window to the Bottom";
        "kwin"."Window Custom Quick Tile Left" = "none,,Custom Quick Tile Window to the Left";
        "kwin"."Window Custom Quick Tile Right" = "none,,Custom Quick Tile Window to the Right";
        "kwin"."Window Custom Quick Tile Top" = "none,,Custom Quick Tile Window to the Top";
        "kwin"."Window Fullscreen" = "none,,Make Window Fullscreen";
        "kwin"."Window Grow Horizontal" = "none,,Expand Window Horizontally";
        "kwin"."Window Grow Vertical" = "none,,Expand Window Vertically";
        "kwin"."Window Lower" = "none,,Lower Window";
        "kwin"."Window Maximize" = "Meta+PgUp";
        "kwin"."Window Maximize Horizontal" = "none,,Maximize Window Horizontally";
        "kwin"."Window Maximize Vertical" = "none,,Maximize Window Vertically";
        "kwin"."Window Minimize" = "Meta+PgDown";
        "kwin"."Window Move" = "none,,Move Window";
        "kwin"."Window Move Center" = "none,,Move Window to the Center";
        "kwin"."Window No Border" = "none,,Toggle Window Titlebar and Frame";
        "kwin"."Window On All Desktops" = "none,,Keep Window on All Desktops";
        "kwin"."Window One Desktop Down" = "Meta+Ctrl+Shift+Down";
        "kwin"."Window One Desktop Up" = "Meta+Ctrl+Shift+Up";
        "kwin"."Window One Desktop to the Left" = "Meta+Ctrl+Shift+Left";
        "kwin"."Window One Desktop to the Right" = "Meta+Ctrl+Shift+Right";
        "kwin"."Window One Screen Down" = "none,,Move Window One Screen Down";
        "kwin"."Window One Screen Up" = "none,,Move Window One Screen Up";
        "kwin"."Window One Screen to the Left" = "none,,Move Window One Screen to the Left";
        "kwin"."Window One Screen to the Right" = "none,,Move Window One Screen to the Right";
        "kwin"."Window Operations Menu" = "Alt+F3";
        "kwin"."Window Pack Down" = "none,,Move Window Down";
        "kwin"."Window Pack Left" = "none,,Move Window Left";
        "kwin"."Window Pack Right" = "none,,Move Window Right";
        "kwin"."Window Pack Up" = "none,,Move Window Up";
        "kwin"."Window Quick Tile Bottom" = "Meta+Down";
        "kwin"."Window Quick Tile Bottom Left" = "none,,Quick Tile Window to the Bottom Left";
        "kwin"."Window Quick Tile Bottom Right" = "none,,Quick Tile Window to the Bottom Right";
        "kwin"."Window Quick Tile Left" = "Meta+Left";
        "kwin"."Window Quick Tile Right" = "Meta+Right";
        "kwin"."Window Quick Tile Top" = "Meta+Up";
        "kwin"."Window Quick Tile Top Left" = "none,,Quick Tile Window to the Top Left";
        "kwin"."Window Quick Tile Top Right" = "none,,Quick Tile Window to the Top Right";
        "kwin"."Window Raise" = "none,,Raise Window";
        "kwin"."Window Resize" = "none,,Resize Window";
        "kwin"."Window Shade" = "none,,Shade Window";
        "kwin"."Window Shrink Horizontal" = "none,,Shrink Window Horizontally";
        "kwin"."Window Shrink Vertical" = "none,,Shrink Window Vertically";
        "kwin"."Window to Desktop 1" = "none,,Window to Desktop 1";
        "kwin"."Window to Desktop 10" = "none,,Window to Desktop 10";
        "kwin"."Window to Desktop 11" = "none,,Window to Desktop 11";
        "kwin"."Window to Desktop 12" = "none,,Window to Desktop 12";
        "kwin"."Window to Desktop 13" = "none,,Window to Desktop 13";
        "kwin"."Window to Desktop 14" = "none,,Window to Desktop 14";
        "kwin"."Window to Desktop 15" = "none,,Window to Desktop 15";
        "kwin"."Window to Desktop 16" = "none,,Window to Desktop 16";
        "kwin"."Window to Desktop 17" = "none,,Window to Desktop 17";
        "kwin"."Window to Desktop 18" = "none,,Window to Desktop 18";
        "kwin"."Window to Desktop 19" = "none,,Window to Desktop 19";
        "kwin"."Window to Desktop 2" = "none,,Window to Desktop 2";
        "kwin"."Window to Desktop 20" = "none,,Window to Desktop 20";
        "kwin"."Window to Desktop 3" = "none,,Window to Desktop 3";
        "kwin"."Window to Desktop 4" = "none,,Window to Desktop 4";
        "kwin"."Window to Desktop 5" = "none,,Window to Desktop 5";
        "kwin"."Window to Desktop 6" = "none,,Window to Desktop 6";
        "kwin"."Window to Desktop 7" = "none,,Window to Desktop 7";
        "kwin"."Window to Desktop 8" = "none,,Window to Desktop 8";
        "kwin"."Window to Desktop 9" = "none,,Window to Desktop 9";
        "kwin"."Window to Next Desktop" = "none,,Window to Next Desktop";
        "kwin"."Window to Next Screen" = "Meta+Shift+Right";
        "kwin"."Window to Previous Desktop" = "none,,Window to Previous Desktop";
        "kwin"."Window to Previous Screen" = "Meta+Shift+Left";
        "kwin"."Window to Screen 0" = "none,,Move Window to Screen 0";
        "kwin"."Window to Screen 1" = "none,,Move Window to Screen 1";
        "kwin"."Window to Screen 2" = "none,,Move Window to Screen 2";
        "kwin"."Window to Screen 3" = "none,,Move Window to Screen 3";
        "kwin"."Window to Screen 4" = "none,,Move Window to Screen 4";
        "kwin"."Window to Screen 5" = "none,,Move Window to Screen 5";
        "kwin"."Window to Screen 6" = "none,,Move Window to Screen 6";
        "kwin"."Window to Screen 7" = "none,,Move Window to Screen 7";
        "kwin"."disableInputCapture" = "Meta+Shift+Esc";
        "kwin"."view_actual_size" = "Meta+0";
        "kwin"."view_zoom_in" = ["Meta++" "Meta+=,Meta++" "Meta+=,Zoom In"];
        "kwin"."view_zoom_out" = "Meta+-";
        "mediacontrol"."mediavolumedown" = "none,,Media volume down";
        "mediacontrol"."mediavolumeup" = "none,,Media volume up";
        "mediacontrol"."nextmedia" = "Media Next";
        "mediacontrol"."pausemedia" = "Media Pause";
        "mediacontrol"."playmedia" = "none,,Play media playback";
        "mediacontrol"."playpausemedia" = "Media Play";
        "mediacontrol"."previousmedia" = "Media Previous";
        "mediacontrol"."stopmedia" = "Media Stop";
        "org_kde_powerdevil"."Decrease Keyboard Brightness" = "Keyboard Brightness Down";
        "org_kde_powerdevil"."Decrease Screen Brightness" = "Monitor Brightness Down";
        "org_kde_powerdevil"."Decrease Screen Brightness Small" = "Shift+Monitor Brightness Down";
        "org_kde_powerdevil"."Hibernate" = "Hibernate";
        "org_kde_powerdevil"."Increase Keyboard Brightness" = "Keyboard Brightness Up";
        "org_kde_powerdevil"."Increase Screen Brightness" = "Monitor Brightness Up";
        "org_kde_powerdevil"."Increase Screen Brightness Small" = "Shift+Monitor Brightness Up";
        "org_kde_powerdevil"."PowerDown" = "Power Down";
        "org_kde_powerdevil"."PowerOff" = "Power Off";
        "org_kde_powerdevil"."Sleep" = "Sleep";
        "org_kde_powerdevil"."Toggle Keyboard Backlight" = "Keyboard Light On/Off";
        "org_kde_powerdevil"."Turn Off Screen" = [ ];
        "org_kde_powerdevil"."powerProfile" = ["Battery" "Meta+B,Battery" "Meta+B,Switch Power Profile"];
        "plasmashell"."activate application launcher" = ["Meta" "Alt+F1,Meta" "Alt+F1,Activate Application Launcher"];
        "plasmashell"."activate task manager entry 1" = "Meta+1";
        "plasmashell"."activate task manager entry 10" = "none,,Activate Task Manager Entry 10";
        "plasmashell"."activate task manager entry 2" = "Meta+2";
        "plasmashell"."activate task manager entry 3" = "Meta+3";
        "plasmashell"."activate task manager entry 4" = "Meta+4";
        "plasmashell"."activate task manager entry 5" = "Meta+5";
        "plasmashell"."activate task manager entry 6" = "Meta+6";
        "plasmashell"."activate task manager entry 7" = "Meta+7";
        "plasmashell"."activate task manager entry 8" = "Meta+8";
        "plasmashell"."activate task manager entry 9" = "Meta+9";
        "plasmashell"."clear-history" = "none,,Clear Clipboard History";
        "plasmashell"."clipboard_action" = "Meta+Ctrl+X";
        "plasmashell"."cycle-panels" = "Meta+Alt+P";
        "plasmashell"."cycleNextAction" = "none,,Next History Item";
        "plasmashell"."cyclePrevAction" = "none,,Previous History Item";
        "plasmashell"."manage activities" = "Meta+Q";
        "plasmashell"."next activity" = "Meta+A,none,Walk through activities";
        "plasmashell"."previous activity" = "Meta+Shift+A,none,Walk through activities (Reverse)";
        "plasmashell"."repeat_action" = "none,,Manually Invoke Action on Current Clipboard";
        "plasmashell"."show dashboard" = "Ctrl+F12";
        "plasmashell"."show-barcode" = "none,,Show Barcode…";
        "plasmashell"."show-on-mouse-pos" = "Meta+V";
        "plasmashell"."stop current activity" = "Meta+S";
        "plasmashell"."switch to next activity" = "none,,Switch to Next Activity";
        "plasmashell"."switch to previous activity" = "none,,Switch to Previous Activity";
        "plasmashell"."toggle do not disturb" = "none,,Toggle do not disturb";
      };
      configFile = {
        "baloofilerc"."General"."dbVersion" = 2;
        "baloofilerc"."General"."exclude filters" = "*~,*.part,*.o,*.la,*.lo,*.loT,*.moc,moc_*.cpp,qrc_*.cpp,ui_*.h,cmake_install.cmake,CMakeCache.txt,CTestTestfile.cmake,libtool,config.status,confdefs.h,autom4te,conftest,confstat,Makefile.am,*.gcode,.ninja_deps,.ninja_log,build.ninja,*.csproj,*.m4,*.rej,*.gmo,*.pc,*.omf,*.aux,*.tmp,*.po,*.vm*,*.nvram,*.rcore,*.swp,*.swap,lzo,litmain.sh,*.orig,.histfile.*,.xsession-errors*,*.map,*.so,*.a,*.db,*.qrc,*.ini,*.init,*.img,*.vdi,*.vbox*,vbox.log,*.qcow2,*.vmdk,*.vhd,*.vhdx,*.sql,*.sql.gz,*.ytdl,*.tfstate*,*.class,*.pyc,*.pyo,*.elc,*.qmlc,*.jsc,*.fastq,*.fq,*.gb,*.fasta,*.fna,*.gbff,*.faa,po,CVS,.svn,.git,_darcs,.bzr,.hg,CMakeFiles,CMakeTmp,CMakeTmpQmake,.moc,.obj,.pch,.uic,.npm,.yarn,.yarn-cache,__pycache__,node_modules,node_packages,nbproject,.terraform,.venv,venv,core-dumps,lost+found";
        "baloofilerc"."General"."exclude filters version" = 9;
        "dolphinrc"."General"."ViewPropsTimestamp" = "2025,5,18,1,2,59.074";
        "dolphinrc"."KFileDialog Settings"."Places Icons Auto-resize" = false;
        "dolphinrc"."KFileDialog Settings"."Places Icons Static Size" = 22;
        "kactivitymanagerdrc"."activities"."28b509db-3f16-47c5-8840-76ea60eeac75" = "Default";
        "kactivitymanagerdrc"."main"."currentActivity" = "28b509db-3f16-47c5-8840-76ea60eeac75";
        "kcminputrc"."Libinput/2/7/SynPS\\/2 Synaptics TouchPad"."DisableWhileTyping" = true;
        "kcminputrc"."Libinput/2/7/SynPS\\/2 Synaptics TouchPad"."Enabled" = true;
        "kcminputrc"."Libinput/2/7/SynPS\\/2 Synaptics TouchPad"."LeftHanded" = true;
        "kcminputrc"."Libinput/2/7/SynPS\\/2 Synaptics TouchPad"."MiddleButtonEmulation" = true;
        "kcminputrc"."Libinput/2/7/SynPS\\/2 Synaptics TouchPad"."NaturalScroll" = true;
        "kcminputrc"."Libinput/2/7/SynPS\\/2 Synaptics TouchPad"."PointerAcceleration" = 0;
        "kcminputrc"."Libinput/2/7/SynPS\\/2 Synaptics TouchPad"."TapToClick" = true;
        "kded5rc"."Module-device_automounter"."autoload" = false;
        "kdeglobals"."General"."TerminalApplication" = "foot";
        "kdeglobals"."General"."TerminalService" = "foot.desktop";
        "kdeglobals"."WM"."activeBackground" = "49,54,59";
        "kdeglobals"."WM"."activeBlend" = "252,252,252";
        "kdeglobals"."WM"."activeForeground" = "252,252,252";
        "kdeglobals"."WM"."inactiveBackground" = "42,46,50";
        "kdeglobals"."WM"."inactiveBlend" = "161,169,177";
        "kdeglobals"."WM"."inactiveForeground" = "161,169,177";
        "kscreenlockerrc"."Daemon"."LockOnResume" = true;
        "kscreenlockerrc"."Daemon"."Timeout" = 15;
        "kwalletrc"."Wallet"."First Use" = false;
        "kwinrc"."Desktops"."Id_1" = "Desktop_1";
        "kwinrc"."Desktops"."Id_2" = "Desktop_2";
        "kwinrc"."Desktops"."Id_3" = "Desktop_3";
        "kwinrc"."Desktops"."Id_4" = "Desktop_4";
        "kwinrc"."Desktops"."Id_5" = "Desktop_5";
        "kwinrc"."Desktops"."Id_6" = "Desktop_6";
        "kwinrc"."Desktops"."Id_7" = "Desktop_7";
        "kwinrc"."Desktops"."Id_8" = "Desktop_8";
        "kwinrc"."Desktops"."Id_9" = "Desktop_9";
        "kwinrc"."Desktops"."Number" = 9;
        "kwinrc"."Desktops"."Rows" = 3;
        "kwinrc"."Plugins"."krohnkiteEnabled" = true;
        "kwinrc"."Script-krohnkite"."screenGapBottom" = 8;
        "kwinrc"."Script-krohnkite"."screenGapLeft" = 8;
        "kwinrc"."Script-krohnkite"."screenGapRight" = 8;
        "kwinrc"."Script-krohnkite"."screenGapTop" = 50;
        "kwinrc"."Script-krohnkite"."tileLayoutGap" = 8;
        "kwinrc"."Tiling"."padding" = 4;
        "kwinrc"."Tiling/7d672cf0-e0cf-5d2e-a8f5-4bfc101b4cae"."tiles" = "{\"layoutDirection\":\"horizontal\",\"tiles\":[{\"width\":0.25},{\"width\":0.5},{\"width\":0.25}]}";
        "kwinrc"."Windows"."DelayFocusInterval" = 0;
        "kwinrc"."Windows"."FocusPolicy" = "FocusFollowsMouse";
        "kwinrc"."Windows"."NextFocusPrefersMouse" = true;
        "kwinrc"."Xwayland"."Scale" = 1.05;
        "kwinrulesrc"."1"."Description" = "Set minimum geometry size";
        "kwinrulesrc"."1"."minsize" = "0,0";
        "kwinrulesrc"."1"."minsizerule" = 2;
        "kwinrulesrc"."1"."types" = 1;
        "kwinrulesrc"."General"."count" = 1;
        "kwinrulesrc"."General"."rules" = 1;
        "plasma-localerc"."Formats"."LANG" = "en_US.UTF-8";
        "plasmaparc"."General"."RaiseMaximumVolume" = true;
        "spectaclerc"."Annotations"."annotationToolType" = 5;
        "spectaclerc"."GuiConfig"."captureMode" = 0;
        "spectaclerc"."ImageSave"."translatedScreenshotsFolder" = "Screenshots";
        "spectaclerc"."VideoSave"."translatedScreencastsFolder" = "Screencasts";
      };
      dataFile = {
        "kate/anonymous.katesession"."Document 0"."URL" = "file:///home/desdpy/Downloads/easyroam_nmcli.sh";
        "kate/anonymous.katesession"."Kate Plugins"."cmaketoolsplugin" = false;
        "kate/anonymous.katesession"."Kate Plugins"."compilerexplorer" = false;
        "kate/anonymous.katesession"."Kate Plugins"."eslintplugin" = false;
        "kate/anonymous.katesession"."Kate Plugins"."externaltoolsplugin" = true;
        "kate/anonymous.katesession"."Kate Plugins"."formatplugin" = false;
        "kate/anonymous.katesession"."Kate Plugins"."katebacktracebrowserplugin" = false;
        "kate/anonymous.katesession"."Kate Plugins"."katebuildplugin" = false;
        "kate/anonymous.katesession"."Kate Plugins"."katecloseexceptplugin" = false;
        "kate/anonymous.katesession"."Kate Plugins"."katecolorpickerplugin" = false;
        "kate/anonymous.katesession"."Kate Plugins"."katectagsplugin" = false;
        "kate/anonymous.katesession"."Kate Plugins"."katefilebrowserplugin" = false;
        "kate/anonymous.katesession"."Kate Plugins"."katefiletreeplugin" = true;
        "kate/anonymous.katesession"."Kate Plugins"."kategdbplugin" = false;
        "kate/anonymous.katesession"."Kate Plugins"."kategitblameplugin" = false;
        "kate/anonymous.katesession"."Kate Plugins"."katekonsoleplugin" = true;
        "kate/anonymous.katesession"."Kate Plugins"."kateprojectplugin" = true;
        "kate/anonymous.katesession"."Kate Plugins"."katereplicodeplugin" = false;
        "kate/anonymous.katesession"."Kate Plugins"."katesearchplugin" = true;
        "kate/anonymous.katesession"."Kate Plugins"."katesnippetsplugin" = false;
        "kate/anonymous.katesession"."Kate Plugins"."katesqlplugin" = false;
        "kate/anonymous.katesession"."Kate Plugins"."katesymbolviewerplugin" = false;
        "kate/anonymous.katesession"."Kate Plugins"."katexmlcheckplugin" = false;
        "kate/anonymous.katesession"."Kate Plugins"."katexmltoolsplugin" = false;
        "kate/anonymous.katesession"."Kate Plugins"."keyboardmacrosplugin" = false;
        "kate/anonymous.katesession"."Kate Plugins"."ktexteditorpreviewplugin" = false;
        "kate/anonymous.katesession"."Kate Plugins"."latexcompletionplugin" = false;
        "kate/anonymous.katesession"."Kate Plugins"."lspclientplugin" = true;
        "kate/anonymous.katesession"."Kate Plugins"."openlinkplugin" = false;
        "kate/anonymous.katesession"."Kate Plugins"."rainbowparens" = false;
        "kate/anonymous.katesession"."Kate Plugins"."rbqlplugin" = false;
        "kate/anonymous.katesession"."Kate Plugins"."tabswitcherplugin" = true;
        "kate/anonymous.katesession"."Kate Plugins"."templateplugin" = false;
        "kate/anonymous.katesession"."Kate Plugins"."textfilterplugin" = true;
        "kate/anonymous.katesession"."MainWindow0"."Active ViewSpace" = 0;
        "kate/anonymous.katesession"."MainWindow0"."Kate-MDI-H-Splitter" = "0,855,0";
        "kate/anonymous.katesession"."MainWindow0"."Kate-MDI-Sidebar-0-Bar-0-TvList" = "kate_private_plugin_katefiletreeplugin,kateproject,kateprojectgit,lspclient_symbol_outline";
        "kate/anonymous.katesession"."MainWindow0"."Kate-MDI-Sidebar-0-LastSize" = 200;
        "kate/anonymous.katesession"."MainWindow0"."Kate-MDI-Sidebar-0-SectSizes" = 0;
        "kate/anonymous.katesession"."MainWindow0"."Kate-MDI-Sidebar-0-Splitter" = 833;
        "kate/anonymous.katesession"."MainWindow0"."Kate-MDI-Sidebar-1-Bar-0-TvList" = "";
        "kate/anonymous.katesession"."MainWindow0"."Kate-MDI-Sidebar-1-LastSize" = 200;
        "kate/anonymous.katesession"."MainWindow0"."Kate-MDI-Sidebar-1-SectSizes" = 0;
        "kate/anonymous.katesession"."MainWindow0"."Kate-MDI-Sidebar-1-Splitter" = 0;
        "kate/anonymous.katesession"."MainWindow0"."Kate-MDI-Sidebar-2-Bar-0-TvList" = "";
        "kate/anonymous.katesession"."MainWindow0"."Kate-MDI-Sidebar-2-LastSize" = 200;
        "kate/anonymous.katesession"."MainWindow0"."Kate-MDI-Sidebar-2-SectSizes" = 0;
        "kate/anonymous.katesession"."MainWindow0"."Kate-MDI-Sidebar-2-Splitter" = 0;
        "kate/anonymous.katesession"."MainWindow0"."Kate-MDI-Sidebar-3-Bar-0-TvList" = "output,diagnostics,kate_plugin_katesearch,kateprojectinfo,kate_private_plugin_katekonsoleplugin";
        "kate/anonymous.katesession"."MainWindow0"."Kate-MDI-Sidebar-3-LastSize" = 200;
        "kate/anonymous.katesession"."MainWindow0"."Kate-MDI-Sidebar-3-SectSizes" = 0;
        "kate/anonymous.katesession"."MainWindow0"."Kate-MDI-Sidebar-3-Splitter" = 605;
        "kate/anonymous.katesession"."MainWindow0"."Kate-MDI-Sidebar-Style" = 2;
        "kate/anonymous.katesession"."MainWindow0"."Kate-MDI-Sidebar-Visible" = true;
        "kate/anonymous.katesession"."MainWindow0"."Kate-MDI-ToolView-diagnostics-Position" = 3;
        "kate/anonymous.katesession"."MainWindow0"."Kate-MDI-ToolView-diagnostics-Show-Button-In-Sidebar" = true;
        "kate/anonymous.katesession"."MainWindow0"."Kate-MDI-ToolView-diagnostics-Visible" = false;
        "kate/anonymous.katesession"."MainWindow0"."Kate-MDI-ToolView-kate_plugin_katesearch-Position" = 3;
        "kate/anonymous.katesession"."MainWindow0"."Kate-MDI-ToolView-kate_plugin_katesearch-Show-Button-In-Sidebar" = true;
        "kate/anonymous.katesession"."MainWindow0"."Kate-MDI-ToolView-kate_plugin_katesearch-Visible" = false;
        "kate/anonymous.katesession"."MainWindow0"."Kate-MDI-ToolView-kate_private_plugin_katefiletreeplugin-Position" = 0;
        "kate/anonymous.katesession"."MainWindow0"."Kate-MDI-ToolView-kate_private_plugin_katefiletreeplugin-Show-Button-In-Sidebar" = true;
        "kate/anonymous.katesession"."MainWindow0"."Kate-MDI-ToolView-kate_private_plugin_katefiletreeplugin-Visible" = false;
        "kate/anonymous.katesession"."MainWindow0"."Kate-MDI-ToolView-kate_private_plugin_katekonsoleplugin-Position" = 3;
        "kate/anonymous.katesession"."MainWindow0"."Kate-MDI-ToolView-kate_private_plugin_katekonsoleplugin-Show-Button-In-Sidebar" = true;
        "kate/anonymous.katesession"."MainWindow0"."Kate-MDI-ToolView-kate_private_plugin_katekonsoleplugin-Visible" = false;
        "kate/anonymous.katesession"."MainWindow0"."Kate-MDI-ToolView-kateproject-Position" = 0;
        "kate/anonymous.katesession"."MainWindow0"."Kate-MDI-ToolView-kateproject-Show-Button-In-Sidebar" = true;
        "kate/anonymous.katesession"."MainWindow0"."Kate-MDI-ToolView-kateproject-Visible" = false;
        "kate/anonymous.katesession"."MainWindow0"."Kate-MDI-ToolView-kateprojectgit-Position" = 0;
        "kate/anonymous.katesession"."MainWindow0"."Kate-MDI-ToolView-kateprojectgit-Show-Button-In-Sidebar" = true;
        "kate/anonymous.katesession"."MainWindow0"."Kate-MDI-ToolView-kateprojectgit-Visible" = false;
        "kate/anonymous.katesession"."MainWindow0"."Kate-MDI-ToolView-kateprojectinfo-Position" = 3;
        "kate/anonymous.katesession"."MainWindow0"."Kate-MDI-ToolView-kateprojectinfo-Show-Button-In-Sidebar" = true;
        "kate/anonymous.katesession"."MainWindow0"."Kate-MDI-ToolView-kateprojectinfo-Visible" = false;
        "kate/anonymous.katesession"."MainWindow0"."Kate-MDI-ToolView-lspclient_symbol_outline-Position" = 0;
        "kate/anonymous.katesession"."MainWindow0"."Kate-MDI-ToolView-lspclient_symbol_outline-Show-Button-In-Sidebar" = true;
        "kate/anonymous.katesession"."MainWindow0"."Kate-MDI-ToolView-lspclient_symbol_outline-Visible" = false;
        "kate/anonymous.katesession"."MainWindow0"."Kate-MDI-ToolView-output-Position" = 3;
        "kate/anonymous.katesession"."MainWindow0"."Kate-MDI-ToolView-output-Show-Button-In-Sidebar" = true;
        "kate/anonymous.katesession"."MainWindow0"."Kate-MDI-ToolView-output-Visible" = false;
        "kate/anonymous.katesession"."MainWindow0"."Kate-MDI-V-Splitter" = "0,833,0";
        "kate/anonymous.katesession"."MainWindow0 Settings"."WindowState" = 8;
        "kate/anonymous.katesession"."MainWindow0-Splitter 0"."Children" = "MainWindow0-ViewSpace 0";
        "kate/anonymous.katesession"."MainWindow0-Splitter 0"."Orientation" = 1;
        "kate/anonymous.katesession"."MainWindow0-Splitter 0"."Sizes" = 855;
        "kate/anonymous.katesession"."MainWindow0-ViewSpace 0"."Active View" = 0;
        "kate/anonymous.katesession"."MainWindow0-ViewSpace 0"."Count" = 1;
        "kate/anonymous.katesession"."MainWindow0-ViewSpace 0"."Documents" = 0;
        "kate/anonymous.katesession"."MainWindow0-ViewSpace 0"."View 0" = 0;
        "kate/anonymous.katesession"."Open Documents"."Count" = 1;
        "kate/anonymous.katesession"."Open MainWindows"."Count" = 1;
        "kate/anonymous.katesession"."Plugin:kateprojectplugin:"."projects" = "";
        "kate/anonymous.katesession"."Plugin:katesearchplugin:MainWindow:0"."BinaryFiles" = false;
        "kate/anonymous.katesession"."Plugin:katesearchplugin:MainWindow:0"."CurrentExcludeFilter" = "-1";
        "kate/anonymous.katesession"."Plugin:katesearchplugin:MainWindow:0"."CurrentFilter" = "-1";
        "kate/anonymous.katesession"."Plugin:katesearchplugin:MainWindow:0"."ExcludeFilters" = "";
        "kate/anonymous.katesession"."Plugin:katesearchplugin:MainWindow:0"."ExpandSearchResults" = false;
        "kate/anonymous.katesession"."Plugin:katesearchplugin:MainWindow:0"."Filters" = "";
        "kate/anonymous.katesession"."Plugin:katesearchplugin:MainWindow:0"."FollowSymLink" = false;
        "kate/anonymous.katesession"."Plugin:katesearchplugin:MainWindow:0"."HiddenFiles" = false;
        "kate/anonymous.katesession"."Plugin:katesearchplugin:MainWindow:0"."MatchCase" = false;
        "kate/anonymous.katesession"."Plugin:katesearchplugin:MainWindow:0"."Place" = 1;
        "kate/anonymous.katesession"."Plugin:katesearchplugin:MainWindow:0"."Recursive" = true;
        "kate/anonymous.katesession"."Plugin:katesearchplugin:MainWindow:0"."Replaces" = "";
        "kate/anonymous.katesession"."Plugin:katesearchplugin:MainWindow:0"."Search" = "";
        "kate/anonymous.katesession"."Plugin:katesearchplugin:MainWindow:0"."SearchAsYouTypeAllProjects" = true;
        "kate/anonymous.katesession"."Plugin:katesearchplugin:MainWindow:0"."SearchAsYouTypeCurrentFile" = true;
        "kate/anonymous.katesession"."Plugin:katesearchplugin:MainWindow:0"."SearchAsYouTypeFolder" = true;
        "kate/anonymous.katesession"."Plugin:katesearchplugin:MainWindow:0"."SearchAsYouTypeOpenFiles" = true;
        "kate/anonymous.katesession"."Plugin:katesearchplugin:MainWindow:0"."SearchAsYouTypeProject" = true;
        "kate/anonymous.katesession"."Plugin:katesearchplugin:MainWindow:0"."SearchDiskFiles" = "";
        "kate/anonymous.katesession"."Plugin:katesearchplugin:MainWindow:0"."SearchDiskFiless" = "";
        "kate/anonymous.katesession"."Plugin:katesearchplugin:MainWindow:0"."SizeLimit" = 128;
        "kate/anonymous.katesession"."Plugin:katesearchplugin:MainWindow:0"."UseRegExp" = false;
      };
    };
  } */

  /* home.activation.setupTerminals = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    bash ${./plasma_helpers/set_default_terminal.sh} foot
  ''; */
}
