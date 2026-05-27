{ config, lib, ... }:

{

  config = lib.mkMerge [

    {
      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];
    }

    (lib.mkIf config.thattem.nixos.special.enable {

      nix.settings = {
        substituters = config.thattem.private.nix-serve.substituters;
        trusted-public-keys = config.thattem.private.nix-serve.trusted-public-keys;

      };
    })

    (lib.mkIf config.thattem.nixos.special.enable (
      lib.mkIf (config.thattem.secrets.github-token.path != null) {

        nix.extraOptions = "!include ${config.thattem.secrets.github-token.path}";

      }
    ))

  ];

}
