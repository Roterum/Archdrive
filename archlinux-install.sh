#!/bin/bash

# ###############################################################################
# Roterum Archdrive - Archlinux Install
# This script installs arch linux onto the given drife, setted up for Roterum.
# ###############################################################################


# [>] Download


# [i] Download variables, prepare, chroot, locales and mkinitcpio for archdrive installation.
wget https://raw.githubusercontent.com/Roterum/Archdrive/master/archlinux-install-variables.sh --output-document=./archlinux-install-variables.sh
wget https://raw.githubusercontent.com/Roterum/Archdrive/master/archlinux-install-prepare.sh --output-document=./archlinux-install-prepare.sh
wget https://raw.githubusercontent.com/Roterum/Archdrive/master/archlinux-install-chroot.sh --output-document=./archlinux-install-chroot.sh
wget https://raw.githubusercontent.com/Roterum/Archdrive/master/archlinux-install-locale.gen --output-document=./archlinux-install-locale.gen
wget https://raw.githubusercontent.com/Roterum/Archdrive/master/archlinux-install-mkinitcpio.conf --output-document=./archlinux-install-mkinitcpio.conf


# [>] Configure


# [i] Prompt user to edit installation variables.
read IN_NONE
nano ./archlinux-install-variables.sh

# [i] Import variables.
source ./archlinux-install-variables.sh


# [>] Install


# [i] Start prepare script.
chmod +x ./archlinux-install-prepare.sh
./archlinux-install-prepare.sh

# [i] Move required files to new system.
mkdir /mnt/root/Archdrive
cp ./archlinux-install-variables.sh /mnt/root/Archdrive/archlinux-install-variables.sh
cp ./archlinux-install-chroot.sh /mnt/root/Archdrive/archlinux-install-chroot.sh
cp ./archlinux-install-mkinitcpio.conf /mnt/root/Archdrive/mkinitcpio_new.conf
cp ./archlinux-install-locale.gen /mnt/root/Archdrive/locale_new.gen

# [i] Execute chroot in new system.
chmod +x /mnt/root/Archdrive/archlinux-install-chroot.sh
arch-chroot /mnt /root/Archdrive/archlinux-install-chroot.sh
rm /mnt/root/Archdrive/archlinux-install-chroot.sh


# [>] Cleanup


# [i] Remove downloaded and modified files.
rm ./archlinux-install-variables.sh
rm ./archlinux-install-prepare.sh
rm ./archlinux-install-chroot.sh
rm ./archlinux-install-locales.gen
rm ./archlinux-install-mkinitcpio.conf
rm /mnt/root/Archdrive/archlinux-install-variables.sh
rm /mnt/root/Archdrive/archlinux-install-chroot.sh
rm /mnt/root/Archdrive/mkinitcpio_new.conf
rm /mnt/root/Archdrive/locale_new.gen

# [i] Unmount and swapoff.
umount /mnt/home
umount /mnt
swapoff "$DRIVE"3
