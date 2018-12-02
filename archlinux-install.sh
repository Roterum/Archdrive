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
wget https://raw.githubusercontent.com/Roterum/Archdrive/master/archlinux-install-mkinitcpio.conf --output-document=./archlinux-install-mkinitcpio.conf
wget https://raw.githubusercontent.com/Roterum/Archdrive/master/archlinux-install-locale.gen --output-document=./archlinux-install-locale.gen
wget https://raw.githubusercontent.com/Roterum/Archdrive/master/archlinux-install-sudoers --output-document=./archlinux-install-sudoers
wget https://raw.githubusercontent.com/Roterum/Archdrive/master/archlinux-install-setup.sh --output-document=./archlinux-install-setup.sh
wget https://raw.githubusercontent.com/Roterum/Archdrive/master/archlinux-install-packages.sh --output-document=./archlinux-install-packages.sh


# [>] Configure


# [i] Prompt user to edit installation variables.
nano ./archlinux-install-variables.sh

# [i] Import variables.
source ./archlinux-install-variables.sh


# [>] Install


# [i] Start prepare script.
chmod +x ./archlinux-install-prepare.sh
./archlinux-install-prepare.sh

# [i] Move required files to new system.
cp ./archlinux-install-variables.sh /mnt/root/archlinux-install-variables.sh
cp ./archlinux-install-chroot.sh /mnt/root/archlinux-install-chroot.sh
chmod +x /mnt/root/archlinux-install-chroot.sh
cp ./archlinux-install-packages.sh /mnt/root/archlinux-install-packages.sh
chmod +x /mnt/root/archlinux-install-packages.sh
cp ./archlinux-install-setup.sh /mnt/root/archlinux-install-setup.sh
chmod +x /mnt/root/archlinux-install-setup.sh
cp ./archlinux-install-mkinitcpio.conf /mnt/root/mkinitcpio_new.conf
cp ./archlinux-install-locale.gen /mnt/root/locale_new.gen
cp ./archlinux-install-sudoers /mnt/root/sudoers_new

# [i] Execute chroot in new system.
arch-chroot /mnt /root/archlinux-install-chroot.sh


# [>] Cleanup


# [i] Remove downloaded and modified files.
rm ./archlinux-install-variables.sh
rm ./archlinux-install-prepare.sh
rm ./archlinux-install-chroot.sh
rm ./archlinux-install-locale.gen
rm ./archlinux-install-mkinitcpio.conf
rm /mnt/root/archlinux-install-chroot.sh

# [i] Unmount and swapoff.
umount /mnt/drive
umount /mnt
swapoff "$DRIVE"3

# [i] Reboot the system, to start new installation.
#reboot
