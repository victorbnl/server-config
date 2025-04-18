build:
	nix build path:.#nixosConfigurations.Victor-Server.config.system.build.diskoImages

flash DISK:
	cat result/*.img > {{DISK}}
	sync

deploy REMOTE:
	nixos-rebuild switch --flake path:.#Victor-Server --target-host {{REMOTE}}
