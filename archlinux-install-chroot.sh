

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
mv /etc/mkinitcpio.conf /root/Archdrive/mkinitcpio_original.conf
mv /root/Archdrive/mkinitcpio_new.conf /etc/mkinitcpio.conf
mkinitcpio -p linux

# [i] Install GRUB2.
pacman -Sy grub
grub-install --target=i386-pc $DRIVE
grub-mkconfig -o /boot/grub/grub.cfg


printf "\n\nSet installation root password.\n\n"
passwd
