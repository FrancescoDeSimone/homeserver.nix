{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./applications.nix
      ./services.nix
      ./docker.nix
      ./filesystem.nix
      ./lxd.nix
      ./transcoding.nix
      ./schedule.nix
    ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
  networking.hostName = "homeserver";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Rome";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "it_IT.UTF-8";
    LC_IDENTIFICATION = "it_IT.UTF-8";
    LC_MEASUREMENT = "it_IT.UTF-8";
    LC_MONETARY = "it_IT.UTF-8";
    LC_NAME = "it_IT.UTF-8";
    LC_NUMERIC = "it_IT.UTF-8";
    LC_PAPER = "it_IT.UTF-8";
    LC_TELEPHONE = "it_IT.UTF-8";
    LC_TIME = "it_IT.UTF-8";
  };
  users.users.desi = {
    isNormalUser = true;
    description = "desi";
    extraGroups = [ "networkmanager" "wheel" "lxd" "docker" ];
    packages = with pkgs; [];
  };
  services.getty.autologinUser = "desi";
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "22.11"; # Did you read the comment?
}
