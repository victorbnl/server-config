build:
	nix build .#nixosConfigurations.Victor-Server.config.system.build.image

flash DISK:
	cat result/*.img > {{DISK}}
	sync

deploy REMOTE:
	nixos-rebuild switch --flake path:.#Victor-Server --target-host {{REMOTE}}
