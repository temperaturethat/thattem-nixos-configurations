{ config, lib, ... }:

{

  config = lib.mkMerge [

    {
      users.users.root = {
        uid = 0;
        name = "root";
      };
    }

    (lib.mkIf config.thattem.nixos.special.enable {
      users.users.root = {
        hashedPasswordFile = config.thattem.secrets.passwords.users.root.path;
      };
    })

  ];

}
