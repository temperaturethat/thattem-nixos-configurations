{ config, lib, ... }:

{

  config = lib.mkIf config.thattem.nixos.desktop.enable {

    services = {
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
    };
  };

}
