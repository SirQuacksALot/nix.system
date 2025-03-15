{
  config = ''
      {
          "layer": "top", // Waybar at top layer
          "position": "bottom", // Waybar position (top|bottom|left|right)
          "height": 32, // Waybar height
          // "width": 120, // Waybar width
          // Choose the order of the modules
          "modules-left": ["sway/workspaces", "sway/mode", "custom/media"],
          "modules-center": ["sway/window"],
          "modules-right": ["tray","pulseaudio", "network", "cpu", "memory", "temperature", "backlight", "battery", "battery#bat2", "clock"],
          // Modules configuration
          "sway/workspaces": {
              "disable-scroll": true,
              "disable-markup" : false,
              "all-outputs": true,
              "format": "  {icon}  ",
              //"format":"{icon}",
              "format-icons": {
                  "1": "",
                  "2": "",
                  "3": "",
                  "10": "",
                  "4": "",
                  "5": "",
                  "focused": "",
                  "default": ""
              }
          },
          "sway/mode": {
              "format": "<span style=\"italic\">{}</span>"
          },
          "idle_inhibitor": {
              "format": "{icon}",
              "format-icons": {
                  "activated": "",
                  "deactivated": ""
              }
          },
          "tray": {
              "icon-size": 21,
              "spacing": 10
          },
          "clock": {
              "tooltip-format": "{:%Y-%m-%d | %H:%M}",
              "format-alt": "{:%Y-%m-%d}"
          },
          "cpu": {
              "format": "{usage}% "
          },
          "memory": {
              "format": "{}% "
          },
          "temperature": {
              // "thermal-zone": 2,
              // "hwmon-path": "/sys/class/hwmon/hwmon2/temp1_input",
              "critical-threshold": 80,
              // "format-critical": "{temperatureC}°C ",
              "format": "{temperatureC}°C "
          },
          "backlight": {
              // "device": "acpi_video1",
              "format": "{percent}% {icon}",
              "states": [0,50],
              "format-icons": ["", ""]
          },
          "battery": {
              "states": {
                  "good": 95,
                  "warning": 30,
                  "critical": 15
              },
              "format": "{capacity}% {icon}",
              // "format-good": "", // An empty format will hide the module
              // "format-full": "",
              "format-icons": ["", "", "", "", ""]
          },
          "battery#bat2": {
              "bat": "BAT2"
          },
          "network": {
              // "interface": "wlp2s0", // (Optional) To force the use of this interface
              "format-wifi": "{essid} ({signalStrength}%) ",
              "format-ethernet": "{ifname}: {ipaddr}/{cidr} ",
              "format-disconnected": "Disconnected ⚠",
              "interval" : 7
          },
          "pulseaudio": {
              //"scroll-step": 1,
              "format": "{volume}% {icon}",
              "format-bluetooth": "{volume}% {icon}",
              "format-muted": "",
              "format-icons": {
                  "headphones": "",
                  "handsfree": "",
                  "headset": "",
                  "phone": "",
                  "portable": "",
                  "car": "",
                  "default": ["", ""]
              },
              "on-click": "pavucontrol"
          },
          "custom/media": {
              "format": "{icon} {}",
              "return-type": "json",
              "max-length": 40,
              "format-icons": {
                  "spotify": "",
                  "default": "🎜"
              },
              "escape": true,
              "exec": "$HOME/.config/waybar/mediaplayer.py 2> /dev/null" // Script in resources folder
          }
      }
  '';

  styles = ''
    * {
        border: none;
        border-radius: 0;
        font-family: Roboto,'Font Awesome 5', 'SFNS Display',  Helvetica, Arial, sans-serif;
        font-size: 13px;
        min-height: 0;
    }

    window#waybar {
        background: rgba(43, 48, 59, 0.5);
        border-bottom: 3px solid rgba(100, 114, 125, 0.5);
        color: #ffffff;
    }

    window#waybar.hidden {
        opacity: 0.0;
    }
    /* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
    #workspaces button {
        padding: 0 5px;
        background: transparent;
        color: #ffffff;
        border-bottom: 3px solid transparent;
    }

    #workspaces button.focused {
        background: #64727D;
        border-bottom: 3px solid #ffffff;
    }

    #workspaces button.urgent {
        background-color: #eb4d4b;
    }

    #mode {
        background: #64727D;
        border-bottom: 3px solid #ffffff;
    }

    #clock, #battery, #cpu, #memory, #temperature, #backlight, #network, #pulseaudio, #custom-media, #tray, #mode, #idle_inhibitor {
        padding: 0 10px;
        margin: 0 5px;
    }

    #clock {
        background-color: #64727D;
    }

    #battery {
        background-color: #ffffff;
        color: #000000;
    }

    #battery.charging {
        color: #ffffff;
        background-color: #26A65B;
    }

    @keyframes blink {
        to {
            background-color: #ffffff;
            color: #000000;
        }
    }

    #battery.critical:not(.charging) {
        background: #f53c3c;
        color: #ffffff;
        animation-name: blink;
        animation-duration: 0.5s;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
    }

    #cpu {
        background: #2ecc71;
        color: #000000;
    }

    #memory {
        background: #9b59b6;
    }

    #backlight {
        background: #90b1b1;
    }

    #network {
        background: #2980b9;
    }

    #network.disconnected {
        background: #f53c3c;
    }

    #pulseaudio {
        background: #f1c40f;
        color: #000000;
    }

    #pulseaudio.muted {
        background: #90b1b1;
        color: #2a5c45;
    }

    #custom-media {
        background: #66cc99;
        color: #2a5c45;
    }

    .custom-spotify {
        background: #66cc99;
    }

    .custom-vlc {
        background: #ffa000;
    }

    #temperature {
        background: #f0932b;
    }

    #temperature.critical {
        background: #eb4d4b;
    }

    #tray {
        background-color: #2980b9;
    }

    #idle_inhibitor {
        background-color: #2d3436;
    }

    #idle_inhibitor.activated {
        background-color: #ecf0f1;
        color: #2d3436;
    }
  '';
}