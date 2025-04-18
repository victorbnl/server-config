build:
	nix build path:$(pwd)#nixosConfigurations.Victor-Server.config.system.build.image

flash DISK:
	cat result/*.img > {{DISK}}
	sync

deploy REMOTE:
	nixos-rebuild switch --flake path:$(pwd)#Victor-Server --target-host {{REMOTE}}
