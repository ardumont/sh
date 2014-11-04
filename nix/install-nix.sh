#!/bin/bash -x

sudo mkdir /nix
sudo chown travis: /nix
bash <(curl https://nixos.org/nix/install)

echo "if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi" >> .profile
echo "export PATH=$HOME/.nix-profile/bin:$PATH" >> .profile
