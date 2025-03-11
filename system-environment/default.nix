{ username, ... }: {
  imports = [
    ./modules
    ./fonts
    ./services
    ./programs
    ./desktop
  ];

  # Define the system user
  system-user.enable = true;
  system-user.username = username;
}