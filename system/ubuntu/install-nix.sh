#!/bin/bash
#
# Install NIX package manager in single user mode

sh <(curl -L https://nixos.org/nix/install) --no-daemon
source ~/.nix-profile/etc/profile.d/nix.sh

nix-env -i mpd mpc ncmpcpp
