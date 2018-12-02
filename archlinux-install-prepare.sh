#!/bin/bash

source ./archlinux-install-variables.sh


# [>] Prepare


# [i] Set keyboard layout.
loadkeys uk

# [i] Update hardware clock.
timedatectl set-ntp true


# [>] Partitioning


# [i] Create MBR table.
parted -s $DRIVE mklabel msdos

# [i] Create arch root partition.
parted -s $DRIVE mkpart primary ext4 $DRIVE_ROOT_START $DRIVE_ROOT_END
parted -s $DRIVE set 1 boot on
mkfs.ext4 -F "$DRIVE"1

# [i] Create home.
parted -s $DRIVE mkpart primary fat32 $DRIVE_HOME_START $DRIVE_HOME_END
mkfs.fat "$DRIVE"2 -F32

# [i] Create SWAP.
parted -s $DRIVE mkpart primary linux-swap $DRIVE_SWAP_START $DRIVE_SWAP_END
mkswap "$DRIVE"3

# [i] Mount partitions
mount "$DRIVE"1 /mnt
mkdir /mnt/home
mount "$DRIVE"2 /mnt/home
swapon "$DRIVE"3


# [>] Install


# [i] Install base and base-devel.
pacstrap /mnt $INSTALLPKG


# [>] Configure


# [i] Generate fstab.
genfstab -U /mnt >> /mnt/etc/fstab
