source $HOME/.bashrc
if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
if [ -e $HOME/.cargo ]; then export PATH="$HOME/.cargo/bin:$PATH" ; fi
