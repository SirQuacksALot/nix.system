{ username, ... }: {
  imports = [
    ./modules
    ./fonts
    ./services
    ./programs
    ./packages
    ./desktop
    ./shells
  ];

  # Define the system user
  system-user.enable = true;
  system-user.username = username;

  # enable dev stuff - not final
  programs.flutter = {
    enable = true;
    user = username; # Replace with your actual username
    enableAdb = true;       # Enable ADB for Android debugging
    addToKvmGroup = true;   # Add to KVM group for hardware acceleration
  };
}