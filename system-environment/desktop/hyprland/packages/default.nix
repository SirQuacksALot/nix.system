{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    bc              # clac software
    glib            # dependeci for gsettings
    libnotify       # needed for notification agent 
    libappindicator # system stray support
    cpufrequtils    # cpu govener contoll and display
    xdg-user-dirs   # help tools for well known user dirs
    xdg-utils       # help tools to assist with desktop integrations
    unzip

    # programs that need no configuration
    gsettings-qt                      # gnome settings ? 
    ags                               # widgets
    btop                              # resouce monitor
    brightnessctl                     # brightness control
    cava                              # console audio visualizer
    cliphist                          # wayland clipboard manager
    loupe                             # image viewer
    gnome-system-monitor              # system monitor
    grim                              # image grabber from wayland compositor
    gtk-engine-murrine                # theme engine
    hypridle                          # idle daemon for hyprland
    imagemagick                       # image editor
    inxi                              # system info tool - cli
    jq                                # json processor - cli
    libsForQt5.qtstyleplugin-kvantum  # theme engine - svg based for qt5
    nwg-displays                      # output manager for hyprland
    nwg-look                          # editor for wayland env's -gtk3
    # nvtopPackages                     # task monitor for GPU's - htop like
    nautilus                          # file viewer
    pamixer                           # pulse audio mixer
    pavucontrol                       # pulse audio controler
    playerctl                         # media player controler
    pyprland                          # hyprland plugin system
    libsForQt5.qt5ct                  # config tools
    kdePackages.qt6ct                 # config tools - kde qt6
    kdePackages.qtwayland             # cross platform framework for c++
    kdePackages.qtstyleplugin-kvantum # theme engie - kde kvantum qt5
    slurp                             # region selector for wayland
    swappy                            # snapshot toolf for wayland
    wallust                           # color generator form image
    wl-clipboard                      # command line copy and paste utils for wayland
    clipse
    wlogout                           # logout menu for wayland
    xarchiver                         # gtk forntend for zip, tar, ...
    yad                               # gui dialog for shell scrips
    hyprpicker                        # hyprland color picker
  ];
}