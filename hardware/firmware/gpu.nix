{
  config,
  lib,
  pkgs,
  ...
}:

{

  config = lib.mkIf config.thattem.nixos.hardware.enable (
    lib.mkIf config.thattem.nixos.display.enable (
      lib.mkMerge [

        {
          hardware.graphics = {
            enable = true;
            extraPackages = with pkgs; [
              libva-vdpau-driver
              libvdpau
              libvdpau-va-gl
              vdpauinfo
            ];
          };
        }

        (lib.mkIf (config.thattem.private.firmware.gpu == "intel") {

          hardware.graphics.extraPackages = with pkgs; [
            intel-media-driver
            intel-vaapi-driver
            vpl-gpu-rt
          ];

          hardware.intel-gpu-tools.enable = true;

        })

        (lib.mkIf (config.thattem.private.firmware.gpu == "nvidia") {

          hardware.graphics.extraPackages = with pkgs; [
            nvidia-vaapi-driver
          ];

          hardware.nvidia = {
            modesetting.enable = true;
            powerManagement.enable = true;
            nvidiaSettings = true;
            open = true;
          };

        })

      ]
    )
  );

}
