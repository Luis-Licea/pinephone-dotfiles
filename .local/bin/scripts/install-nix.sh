#!/usr/bin/env bash
curl -L https://nixos.org/nix/install | sh -s -- --daemon
sudo systemctl enable nix-daemon.service
sudo usermod -aG nix-users $USER
nix-channel --add https://nixos.org/channels/nixpkgs-unstable
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install
