# services.nix

{ config, pkgs, ... }:

{

  networking.firewall.enable = false;
  services.logind.lidSwitch = "ignore";
  services.openssh.enable = true;

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
    };
  };

  # Enable and configure duplicati as a service
  services.duplicati = {
    enable = true;
    interface = "any";
  };

  # Enable and configure ombi as a service
  services.ombi = {
    enable = true;
    openFirewall = true;
  };

  # Enable and configure gogs as a service
  services.gogs = {
    enable = true;
  };

  services.cron = {
    enable = true;
    systemCronJobs = [
      "*/5 * * * *      root    ~/duckdns/duck.sh >/dev/null 2>&1"
    ];
  };

  systemd.services.yarr = {
    enable = true;
    wantedBy = ["default.target"];
    serviceConfig = {
      User="desi";
      Group="users";  
      ExecStart = "/nix/store/z3pnhpp5nxf8188gkvqksnisjwvpvzr6-system-path/bin/yarr -addr 0.0.0.0:7070";
    };
  };

}


