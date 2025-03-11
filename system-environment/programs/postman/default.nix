{ ... }: {
  users.users.sebastian.packages = with pkgs; [
    postman
  ];
}