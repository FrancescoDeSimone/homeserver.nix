{ config, pkgs, ... }:

{
  networking.nat = {
    enable = true;
    internalInterfaces = ["ve-+"];
    externalInterface = "enp1s0";
    enableIPv6 = true;
  };

  containers.nextcloud = {
    bindMounts = {
      "/nextcloud" =
      {
        hostPath ="/nextcloud";
        isReadOnly = false;
      };
    };
    autoStart = true;
    privateNetwork = true;
    hostAddress = "192.168.100.10";
    localAddress = "192.168.100.11";
    hostAddress6 = "fc00::1";
    localAddress6 = "fc00::2";
    forwardPorts = [
    { protocol = "tcp"; hostPort = 8010; containerPort = 80; }
    ];

    config = { config, pkgs, ... }: {
      services.postgresql = {
        enable = true;
        ensureDatabases = [ "nextcloud" ];
        ensureUsers = [
        {
          name = "nextcloud";
          ensurePermissions."DATABASE nextcloud" = "ALL PRIVILEGES";
        }
        ];
      };
      services.nextcloud = {
        enable = true;
        https = true;
        home = "/nextcloud";
        package = pkgs.nextcloud27;
        hostName = "nextcloud.desimedia.duckdns.org";
        extraAppsEnable = true;
        config = {
          dbtype = "pgsql";
          dbuser = "nextcloud";
          dbhost = "/run/postgresql";
          dbname = "nextcloud";
          adminuser = "desi";
          adminpassFile = "/var/lib/nextcloud/adminpass";
        };
      };

      systemd.services."nextcloud-setup" = {
        requires = [ "postgresql.service" ];
        after = [ "postgresql.service" ];
      };

      system.stateVersion = "23.05";

      networking.firewall = {
        enable = true;
        allowedTCPPorts = [ 80 443];
      };

      environment.etc."resolv.conf".text = "nameserver 8.8.8.8";
    };
  };

}
