{ config, lib, ... }:

{

  config = lib.mkIf config.thattem.nixos.programming.enable (
    lib.mkMerge [

      {
        users.users.programmer = {
          isNormalUser = true;
          name = "programmer";
          description = "Programmer";
          extraGroups = [ "wheel" ];
        };
      }

      (lib.mkIf config.thattem.nixos.special.enable {
        users.users.programmer = {
          hashedPasswordFile = config.thattem.secrets.passwords.users.programmer.path;
        };
      })

    ]
  );

}
