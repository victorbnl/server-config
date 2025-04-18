{ disko, ... }:

{
  imports = [
    disko.nixosModules.disko
  ];

  disko.devices.disk.main = {
    type = "disk";

    content = {
      type = "gpt";

      partitions = {
        esp = {
          type = "EF00";
          size = "1G";

          content = {
            type = "filesystem";
            format = "vfat";
            mountpoint = "/boot";
          };
        };

        root = {
          size = "100%";

          content = {
            type = "filesystem";
            format = "ext4";
            mountpoint = "/";
          };
        };
      };
    };
  };
}
