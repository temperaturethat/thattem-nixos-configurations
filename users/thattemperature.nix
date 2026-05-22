{ config, lib, ... }:

{

  config = lib.mkMerge [

    {
      users.users.thattemperature = {
        isNormalUser = true;
        name = "thattemperature";
        description = "That Temperature";
        extraGroups = [
          "root"
          "networkmanager"
          "wheel"
        ];
      };
    }

    (lib.mkIf config.thattem.nixos.special.enable {
      users.users.thattemperature = {
        hashedPasswordFile = config.thattem.secrets.passwords.users.thattemperature.path;
        openssh.authorizedKeys.keys = config.thattem.private.ssh.trusted-public-keys;
      };
    })

  ];

}
