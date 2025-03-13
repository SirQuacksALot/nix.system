{ pkgs,... }: {
  users.users.sebastian.packages = with pkgs; [
    unstable.vscode
  ];
}