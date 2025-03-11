{ ... }: 

let
  inherit (import ../../../../../variables.nix) keyboardLayout;
in

{
  services.xserver = {
    enable = false;
    xkb = {
      layout = "${keyboardLayout}";
      variant = "";
    };
  };
}