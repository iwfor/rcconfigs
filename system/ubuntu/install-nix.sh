#!/bin/bash
#
# Install NIX package manager in single user mode

bash <(curl https://nixos.org/nix/install)
source ~/.nix-profile/etc/profile.d/nix.sh

nix-env -i mpd mpc ncmpcpp
