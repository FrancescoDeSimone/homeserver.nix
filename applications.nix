# applications.nix

{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wget
    neovim
    openssh
    radarr
    sonarr
    prowlarr
    jellyfin
    transmission
    htop
    duplicati
    ombi
    docker
    gogs
    yarr
    tmux
    openvswitch
  ];
}

