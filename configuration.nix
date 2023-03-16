{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./applications.nix
      ./services.nix
      ./docker.nix
    ];
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/vda";
  boot.loader.grub.useOSProber = true;
  networking.hostName = "homeserver";
networking.firewall.enable = false;
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
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };
  virtualisation.lxd.enable = true;
  users.users.desi = {
    isNormalUser = true;
    description = "desi";
    extraGroups = [ "networkmanager" "wheel" "docker" "lxd"];
    packages = with pkgs; [];
  };
  services.getty.autologinUser = "desi";
  nixpkgs.config.allowUnfree = true;
  services.openssh.enable = true;
  system.stateVersion = "22.11";
  nix.extraOptions = ''
    experimental-features = nix-command
  '';
}

