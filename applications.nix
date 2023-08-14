# applications.nix

{ config, pkgs, ... }:

let
  unstable = import <nixos-unstable-small> { config = { allowUnfree = true; }; };
in
{
  environment.systemPackages = with pkgs; [
      wget
      neovim
      openssh
      radarr
      sonarr
      prowlarr
      jellyfin
      unstable.jellyfin-ffmpeg
      unstable.filebrowser
      unstable.gogs
      glances
      transmission
      htop
      duplicati
      yarr
      tmux
      squid
      smartmontools
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    configure = {
      customRC = ''
        set number
        set cc=80
        set tabstop=2
        set shiftwidth=2
        set expandtab
        '';
    };
  };

}
