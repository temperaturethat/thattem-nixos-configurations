{ config, lib, ... }:

{

  config = lib.mkIf config.thattem.nixos.hardware.enable {

    services.btrfs.autoScrub = {
      enable = true;
      interval = "weekly";
    };
  };

}
