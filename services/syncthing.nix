{ config, lib, ... }:

{

  config = lib.mkIf (config.thattem.nixos.type == "server") (
    lib.mkMerge [

      {
        services.syncthing.enable = true;
      }

      (lib.mkIf config.thattem.nixos.special.enable {
        services.syncthing = {
          key = config.thattem.secrets.syncthing.key.path;
          cert = config.thattem.secrets.syncthing.cert.path;
          settings = {
            devices = config.thattem.private.syncthing.devices;
            folders = {
              "default" = {
                label = "Default Folder";
                id = "default";
                path = "~/Sync/Default";
                type = "receiveonly";
                devices = config.thattem.private.syncthing.default-folder-devices;
              };
              "temporary" = {
                label = "Temporary Files";
                id = "temporary";
                path = "~/Sync/Temporary";
                type = "receiveonly";
                devices = config.thattem.private.syncthing.temporary-folder-devices;
              };
              "archive" = {
                label = "Archived Files";
                id = "archive";
                path = "~/Sync/Archive";
                type = "receiveonly";
                devices = config.thattem.private.syncthing.archive-folder-devices;
              };
              "secret" = {
                label = "Secret Files";
                id = "secret";
                path = "~/Sync/Secret";
                type = "receiveencrypted";
                devices = config.thattem.private.syncthing.secret-folder-devices;
              };
              "secret-2" = {
                label = "Second Secret Files";
                id = "secret-2";
                path = "~/Sync/Secret-2";
                type = "receiveencrypted";
                devices = config.thattem.private.syncthing.secret-folder-2-devices;
              };
            };
            options = {
              localAnnounceEnabled = true;
              relaysEnabled = true;
              urAccepted = 3;
            };
            gui = {
              theme = "default";
              user = "thattemperature";
            };
          };
          guiPasswordFile = config.thattem.secrets.passwords.syncthing.path;
        };
      })

    ]
  );

}
