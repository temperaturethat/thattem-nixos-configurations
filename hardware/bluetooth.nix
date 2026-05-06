{ config, lib, ... }:

{

  config = lib.mkIf config.thattem.nixos.hardware.enable (
    lib.mkIf config.thattem.nixos.advanced.enable {

      hardware.bluetooth = {
        enable = true;
        powerOnBoot = true;
        settings = {
          General = {
            Experimental = true;
            FastConnectable = true;
          };
          Policy = {
            AutoEnable = true;
          };
        };
      };
    }
  );

}
