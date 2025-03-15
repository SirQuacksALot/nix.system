{
  config = ''
    {
        // -------------------------------------------------------------------------
        // Global configuration
        // -------------------------------------------------------------------------

        "layer": "top",

        "position": "top",

        // If height property would be not present, it'd be calculated dynamically
        "height": 30,

        "margin-top": 10,
        "margin-right": 10,
        "margin-bottom": 0,
        "margin-left": 10,

        "modules-left": [
            "group/powermenu",
            "hyprland/workspaces"
        ],
        "modules-center": [
            "hyprland/window"
        ],
        "modules-right": [
            "power-profiles-daemon",
            "pulseaudio",
            "group/network",
            "cpu",
            "memory",
            "battery",
            "group/clock"
        ],


        // -------------------------------------------------------------------------
        // Modules
        // -------------------------------------------------------------------------

        "battery": {
            "interval": 10,
            "states": {
                "warning": 30,
                "critical": 15
            },
            // Connected to AC
            "format": "{capacity}%  󰚥", // Icon: bolt
            // Not connected to AC
            "format-discharging": "{capacity}%  {icon}",
            "format-icons": [
                " ", // Icon: battery-full
                " ", // Icon: battery-three-quarters
                " ", // Icon: battery-half
                " ", // Icon: battery-quarter
                " "  // Icon: battery-empty
            ],
            "tooltip": true
        },

        "group/clock": {
            "orientation": "inherit",
            "drawer": {
                "transition-duration": 500,
                "transition-left-to-right": false
            },
            "modules": [
                "clock#time",
                "clock#date"
            ]

        },

        "clock#time": {
            "interval": 1,
            "format": "   {:%H:%M:%S}",
            "tooltip": false
        },

        "clock#date": {
        "interval": 10,
        "format": "  {:%e %b %Y}", // Icon: calendar-alt
        "tooltip-format": "{:%e %B %Y}"
        },

        "cpu": {
            "interval": 5,
            "format": "   {usage}%", // Icon: microchip
            "states": {
            "warning": 70,
            "critical": 90
            }
        },

        "memory": {
            "interval": 5,
            "format": "   {}%", // Icon: memory
            "states": {
                "warning": 70,
                "critical": 90
            }
        },

        "group/network": {
            "orientation": "inherit",
            "drawer": {
                "transition-duration": 500,
                "transition-left-to-right": true
            },
            "modules": [
                "network#icons",
                "network#text"
            ]
        },

        "network#icons": {
            "interval": 5,
            "format-wifi": " ", // Icon: wifi
            "format-ethernet": "󰈀 ", // Icon: ethernet
            "format-disconnected": "⚠",
            "tooltip-format": "{ifname}: {ipaddr}"
        },

        "network#text": {
            "interval": 5,
            "format-wifi": "{essid} ({signalStrength}%)", // Icon: wifi
            "format-ethernet": "{ipaddr}/{cidr}", // Icon: ethernet
            "format-disconnected": "Disconnected",
            "tooltip-format": "{ifname}: {ipaddr}"
        },

        "hyprland/window": {
            "format": "   {title}",
            "max-length": 120
        },

        "hyprland/workspaces": {
            "all-outputs": false,
            "disable-scroll": true,
            "format": "{icon}",
            "persistent_workspaces": {
                "1": [],
                "2": [],
                "3": []
            },
            "format-icons": {
                "1": "󰌢 ",
                "2": "󰍹 ",
                "3": "󰍹 ",
                "urgent": " ",
                "focused": " ",
                "default": " " 
            }
        },

        "pulseaudio": {
            "scroll-step": 1,
            "format": "{icon} {volume}%",
            "format-bluetooth": "{icon} {volume}%",
            "format-bluetooth-muted": "  {icon}",
            "format-icons": {
                "headphone": " ",
                "phone": " ",
                "portable": " ",
                "car": " ",
                "default": ["", "  ", "  "]
            },
            "on-click": "pavucontrol"
        },

        "group/powermenu": {
            "orientation": "inherit",
            "drawer": {
                "transition-duration": 500,
                "transition-left-to-right": true
            },
            "modules": [
                "custom/poweroff",
                "custom/suspend",
                "custom/reboot",
                "custom/logout",
                "custom/hybernate",
                "custom/lock"
            ]
        },

        "custom/poweroff": {
            "tooltip": false,
            "format": " ",
            "on-click": "shutdown -h now",
            "tooltip-format": "Power Menu"
        },

        "custom/suspend": {
            "tooltip": false,
            "format": " ",
            "on-click": "suspend"
        },

        "custom/reboot": {
            "tooltip": false,
            "format": " ",
            "on-click": "reboot"
        },

        "custom/logout": {
            "tooltip": false,
            "format": "󰍃",
            "on-click": "logout"
        },

        "custom/hybernate": { 
            "tooltip": false,
            "format": "󰒲",
            "on-click": "hybernate"
        },

        "custom/lock": {
            "tooltip": false,
            "format": " ",
            "on-click": "lock"
        },

        "power-profiles-daemon": {
            "format": "{icon}",
            "tooltip-format": "Power profile: {profile}\nDriver: {driver}",
            "tooltip": true,
            "format-icons": {
                "default": "",
                "performance": "",
                "balanced": " ",
                "power-saver": " "
            }
        },

        "temperature": {
            "critical-threshold": 80,
            "interval": 5,
            "format": "{icon}  {temperatureC}°C",
            "format-icons": [
                "", // Icon: temperature-empty
                "", // Icon: temperature-quarter
                "", // Icon: temperature-half
                "", // Icon: temperature-three-quarters
                ""  // Icon: temperature-full
            ],
            "tooltip": true
        }
    }
  '';

  styles = ''
   /* -----------------------------------------------------------------------------
    * Keyframes
    * -------------------------------------------------------------------------- */

    @keyframes blink-warning {
        70% {
            color: white;
        }

        to {
            color: white;
            background-color: orange;
        }
    }

    @keyframes blink-critical {
        70% {
        color: white;
        }

        to {
            color: white;
            background-color: red;
        }
    }


    /* -----------------------------------------------------------------------------
    * Base styles
    * -------------------------------------------------------------------------- */

    /* Reset all styles */
    * {
        border: none;
        border-radius: 0;
        min-height: 0;
        margin: 0;
        padding: 0;
        color: #888888;
    }

    *:hover {
        color: #fff;
    }

    /* The whole bar */
    #waybar {
        background: #101010;
        color: white;
        font-family: Cantarell, Noto Sans, sans-serif;
        font-size: 13px;
        border: solid 0.5px #6E6E6E;
    }

    /* Each module */
    #battery,
    #clock,
    #cpu,
    #memory,
    #mode,
    #network,
    #pulseaudio,
    #temperature,
    #power-profiles-daemon,
    #custom-poweroff,
    #custom-logout,
    #custom-lock,
    #custom-hybernate,
    #custom-suspend {
        padding-left: 10px;
        padding-right: 10px;
    }

    /* -----------------------------------------------------------------------------
    * Module styles
    * -------------------------------------------------------------------------- */

    #battery {
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
    }

    #battery.warning {
        color: orange;
    }

    #battery.critical {
        color: red;
    }

    #battery.warning.discharging {
        animation-name: blink-warning;
        animation-duration: 3s;
    }

    #battery.critical.discharging {
        animation-name: blink-critical;
        animation-duration: 2s;
    }

    #clock {
        /* font-weight: bold; */
    }

    #cpu {
    /* No styles */
    }

    #cpu.warning {
        color: orange;
    }

    #cpu.critical {
        color: red;
    }

    #memory {
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
    }

    #memory.warning {
        color: orange;
    }

    #memory.critical {
        color: red;
        animation-name: blink-critical;
        animation-duration: 2s;
    }

    #network {
        /* No styles */
    }

    #network.disconnected {
        color: orange;
    }

    #pulseaudio {
        /* No styles */
    }

    #pulseaudio.muted {
        /* No styles */
    }

    #custom-spotify {
        color: rgb(102, 220, 105);
    }

    #temperature {
        /* No styles */
    }

    #temperature.critical {
        color: red;
    }

    #custom-poweroff {
        color: #c9545d;
    
    
    }#custom-poweroff:hover {
        color: red;
    }

   #group-powermenu {
    margin: 0px;
    padding: 0px;
   }

    /* #custom-poweroff:hover {
        color: red;
    }*/

    #window {
        font-weight: bold;
    }

    #workspaces button {
        border-top: 2px solid transparent;
        /* To compensate for the top border and still have vertical centering */
        padding-bottom: 2px;
        padding-left: 10px;
        padding-right: 6px;
        color: #888888;
    }

    #workspaces button.focused {
        border-color: #4c7899;
        color: white;
        background-color: #285577;
    }

    #workspaces button.urgent {
        border-color: #c9545d;
        color: #c9545d;
    }
  '';
}