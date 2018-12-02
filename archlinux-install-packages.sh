#!/bin/bash

source /root/archlinux-install-variables.sh

# [>] Preparation


# [i] Install git and clone Archdrive repo for packages source.
pacman -Sy --noconfirm git
git clone "git@github.com:Roterum/Archdrive" /root/Archdrive

# [i] Install SSH and make system accessible to root.
pacman -Sy --noconfirm openssh
cp /etc/ssh/sshd_config /root/sshd_config_original
printf $"\nPermitRootLogin yes\nAllowUsers root\n" >> /etc/ssh/sshd_config
systemctl start sshd

# [i] Prompt user to edit configuration.
clear
printf $"Edit package configuration and press [ENTER] to start installation."
printf $"\nFollowing packages (from /root/Archdrive/packages/) will be installed:\n"
for PKG in "${PACKAGES[@]}"
do
	printf " $PKG"
done
printf $"\n\nSSH is available to root during the package configuration.\n The interface addresses to this machine are:\n\n"
ip address
read IN_NONE
clear

# [i] Restore original sshd configuration and stop service.
systemctl stop sshd
mv /root/sshd_config_original /etc/ssh/sshd_config


# [DEV] TODO: Remove git repo after installation.
