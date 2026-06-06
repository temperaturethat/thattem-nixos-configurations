{ config, lib, pkgs, ... }:

{

  config = lib.mkIf config.thattem.nixos.desktop.enable {

    # Default to Hyprland session
    services.displayManager.defaultSession = "hyprland";

    services.displayManager.sddm = {
      # Enable numlock on login screen
      autoNumlock = true;

      settings = {
        Theme = {
          # Cursor (matches user session)
          CursorTheme = "Future-cursors";
          CursorSize = 32;
        };
      };
    };

    # Cursor theme available system-wide
    environment.systemPackages = with pkgs; [
      future-cursor-theme
    ];

  };

}
