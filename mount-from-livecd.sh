#!/bin/bash
#ne pas toucher a l'ordre

#mount -t ext3 /dev/sda5 /mnt/gentoo/
mount -t ext2 /dev/sda1 /mnt/gentoo/boot
mount -t ext3 /dev/sda6 /mnt/gentoo/home
mount -t reiserfs /dev/hda4 /mnt/gentoo/mnt/sources
mount -t proc none /mnt/gentoo/proc
mount -o bind /dev /mnt/gentoo/dev
