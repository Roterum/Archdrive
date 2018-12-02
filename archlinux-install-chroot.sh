#!/bin/bash
source /root/archlinux-install-variables.sh

# [>] Configuration


# [i] Configure time zone.
ln -sf /usr/share/zoneinfo/$ZONEINFO /etc/localtime
hwclock --systohc

# [i] Configure locale.
mv /etc/locale.gen /root/Archdrive/locale_original.gen
mv /root/Archdrive/locale_new.gen /etc/locale.gen
locale-gen
printf "LANG=$LOCLANG" > /etc/locale.conf
export LANG=$LOCLANG

# [i] Configure keyboard layout.
printf "KEYMAP=$VCONKM\n" > /etc/vconsole.conf
export KEYMAPP=VCONKM

# [i] Configure hostname.
printf $HOSTNAME > /etc/hostname

# [i] Configure hosts file.
printf "# Hosts file, see: hosts(5).\n" > /etc/hosts
printf "127.0.0.1\tlocalhost\n" >> /etc/hosts
printf "::1\tlocalhost\n" >> /etc/hosts
printf "127.0.0.1\t$HOSTNAME\n" >> /etc/hosts

# [i] Configure mkinitcpio.
mv /etc/mkinitcpio.conf /root/mkinitcpio_original.conf
mv /root/mkinitcpio_new.conf /etc/mkinitcpio.conf
mkinitcpio -p linux

# [i] Install GRUB2.
pacman -Sy --noconfirm grub
grub-install --target=i386-pc $DRIVE
grub-mkconfig -o /boot/grub/grub.cfg


# [>] User Configuration


# [i] Create new user for roterum.
useradd -m $USERNAME

# [i] Add user to sudoers.
printf "$USERNAME ALL=(ALL) ALL" >> /etc/sudoers

# [i] Set root password.
echo root:$PASSWD_ROOT | chpasswd

# [i] Set user password.
echo $USERNAME:$PASSWD_USER | chpasswd