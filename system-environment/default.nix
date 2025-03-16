{ username, ... }: {
  imports = [
    ./modules
    ./fonts
    ./services
    ./programs
    ./packages
    ./desktop
  ];

  # Define the system user
  system-user.enable = true;
  system-user.username = username;
}