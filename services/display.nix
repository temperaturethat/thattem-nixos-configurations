{ config, lib, pkgs, ... }:

{

  config = lib.mkIf config.thattem.nixos.desktop.enable {

    # SDDM with native Wayland — no xserver needed
    services.displayManager.sddm.enable = true;
    services.displayManager.sddm.wayland.enable = true;
    programs.hyprland.enable = true;

    # Hint Electron apps to use Wayland
    environment.sessionVariables.NIXOS_OZONE_WL = "1";

    # Required for screensharing
    xdg.portal = {
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
    };

  };

}
