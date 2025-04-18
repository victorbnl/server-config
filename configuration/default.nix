{ pkgs, modulesPath, ... }:

{
  imports = [
    ./disko.nix
  ];

  hardware.enableRedistributableFirmware = true;

  boot.loader.timeout = 0;

  zramSwap.enable = true;

  time.timeZone = "Europe/Paris";
  i18n.defaultLocale = "en_US.UTF-8";

  networking = {
    hostName = "Victor-Server";
    useDHCP = true;
    wireless.enable = true;
  };

  services.openssh = {
    enable = true;

    settings = {
      PasswordAuthentication = true;
      PermitRootLogin = "yes";
    };
  };

  users.mutableUsers = false;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "25.05";
}
