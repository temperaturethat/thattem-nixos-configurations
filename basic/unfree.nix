{ lib, ... }:

{

  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "steam"
      "steam-unwrapped"

      "qq"
      "wechat"
      "discord"

      "nvidia-x11"
      "nvidia-settings"

      "ventoy"
    ];

}
