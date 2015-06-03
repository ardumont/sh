#!/usr/bin/env bash

# source: https://nixos.org/wiki/How_to_add_files_to_the_nix-store
sudo unshare -m bash

/home/tony/Downloads/1hrda3v838wprr06878qfc0w930kxf11saln8igrv5z5mjmdcrdv.nar.xz

# largenar=$1
# storepath=$2

largenar=/home/tony/Downloads/0sys5000g3f0nxrjgh6bxadnm85xfn787qr8wx3vpygh6dds4kwd.nar.xz
storepath=/nix/store/wg53f6jq3jaidbcswvdb35b3saw4ib2w-texlive-core-2014qq
mount -o remount,rw /nix/store
xzcat $largenar | nix-store --restore $storepath
printf "$storepath\n\n0\n" | nix-store --register-validity --reregister
# exit to shell where /nix/store is still mounted read-only
exit
