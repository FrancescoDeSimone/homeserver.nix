# services.nix

{ config, pkgs, ... }:

{

  networking.firewall.enable = false;
  services.logind.lidSwitch = "ignore";
  services.openssh.enable = true;
  services.smartd.enable = true;

# Enable and configure sonarr as a service
  services.sonarr = {
    enable = true;
    openFirewall = true;
    user = "desi";
  };

# Enable and configure radarr as a service
  services.radarr = {
    enable = true;
    openFirewall = true;
    user = "desi";
  };

# Enable and configure jellyfin as a service
  services.jellyfin = {
    enable = true;
    openFirewall = true;
    user = "desi";
  };

# Enable and configure prowlarr as a service
  services.prowlarr = {
    enable = true;
    openFirewall = true;
  };

  disabledModules = [ "services/misc/gogs.nix" ];
  imports =
    [ # Use gogs service from nixos-unstable channel.
    <nixos-unstable-small/nixos/modules/services/misc/gogs.nix>
    ];

  services.gogs = {
    enable = true;
  };

# Enable and configure transmission as a service
  services.transmission = {
    enable = true;
    openRPCPort = true;
    openFirewall = true;
    user = "desi";
    settings = {
      rpc-bind-address="0.0.0.0";
      rpc-whitelist-enabled = false;
      home = "/data/transmission";
      download-dir = "/data/transmission/Downloads";
      incomplete-dir = "/data/transmission/.incomplete";
      watch-dir = "/data/transmission/watchdir";
      alt-speed-time-enabled = true;
      alt-speed-time-end = 1410;
    };
  };

# Enable and configure duplicati as a service
  services.duplicati = {
    enable = true;
    interface = "any";
  };

  services.jellyseerr = {
    enable = true;
    openFirewall = true;
  };

  services.squid = {
    enable = true;
    proxyPort = 433;
  };

  systemd.services.glances = {
    enable = true;
    wantedBy = ["default.target"];
    serviceConfig = {
      User="desi";
      Group="users";
      ExecStart = "/run/current-system/sw/bin/glances -w";
    };
  };

  systemd.services.yarr = {
    enable = true;
    wantedBy = ["default.target"];
    serviceConfig = {
      User="desi";
      Group="users";
      ExecStart = "/run/current-system/sw/bin/yarr -addr 0.0.0.0:7070";
    };
  };

  systemd.services.filebrowser = {
    enable = true;
    wantedBy = ["default.target"];
    serviceConfig = {
      User="root";
      Group="wheel";
      ExecStart = "/run/current-system/sw/bin/filebrowser --database /var/lib/filebrowser/filebrowser.db --address 0.0.0.0 -p 8080";
    };
  };

}
