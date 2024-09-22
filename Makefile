.PHONY: update
update:
	home-manager switch --flake .#syk

.PHONY: clean
clean:
	nix-collect-garbage -d
