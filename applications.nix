# applications.nix

{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wget
    neovim
    openssh
    sonarr
    radarr
    prowlarr
    jellyfin
    transmission
    htop
    duplicati
    ombi
    docker
    lxd
    gogs
    yarr
  ];
}

