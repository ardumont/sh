#!/usr/bin/env bash
# nixos install

set -x
set -e

# pre-requisite manual steps:

# network
# wpa_passphrase SSID PASSPHRASE > /etc/wpa_supplicant.conf
# systemctl restart wpa_supplicant.services

# nix-env -i wget

# partition disk:
# fdisk /dev/sda
# sda1 /boot
# sda2 swap
# sda3 /

mkfs.ext4 -L boot /dev/sda1
mkswap -L swap /dev/sda2
mkfs.ext4 -L root /dev/sda3

mount /dev/disk/by-label/root /mnt/
mkdir /mnt/boot && mount /dev/disk/by-label/boot /mnt/boot
swapon /dev/disk/by-label/swap

nixos-generate-config --root=/mnt

[ -f /etc/wpa_supplicant.conf ] && cp /etc/wpa_supplicant.conf /mnt/etc/

wget https://raw.githubusercontent.com/ardumont/dot-files/master/nixos/configuration.nix --output-document /mnt/etc/nixos/configuration.nix

nixos-install
