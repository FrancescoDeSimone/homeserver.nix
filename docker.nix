{ config, pkgs, ... }:

{
  virtualisation.docker.enable= true;
  virtualisation.oci-containers = {
    containers = {
      flaresolverr = {
        image = "ghcr.io/flaresolverr/flaresolverr:latest";
        ports = [ "8191:8191" ];
      };
      homer = {
        image = "b4bz/homer:latest";
        ports = ["80:8080"];
        volumes = [ "/home/desi/.config/homer/config.yml/:/www/assets/config.yml"];
      };
      nginxproxymanager= {
        image = "jc21/nginx-proxy-manager:latest";
        ports = [ "81:81" "443:443"];
      };
    };
  };
}

