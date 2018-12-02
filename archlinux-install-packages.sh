#!/bin/bash

source /root/archlinux-install-variables.sh

# [>] Preparation


# [i] Clone Archdrive repo for packages source.
git clone "https://github.com/Roterum/Archdrive.git" /root/Archdrive

# [i] Make system accessible to root over SSH.
cp /etc/ssh/sshd_config /root/sshd_config_original
printf $"\nPermitRootLogin yes\nAllowUsers $USERNAME root\n" >> /etc/ssh/sshd_config
systemctl start sshd

# [i] Prompt user to edit configuration.
clear
printf $"Edit package configuration and press [ENTER] to start installation.\nFollowing packages (from /root/Archdrive/packages/) will be installed:\n"
for PKG in "${PACKAGES[@]}"
do
	printf " $PKG"
done
printf $"\n\nSSH is available to root during the package configuration.\nThe interface addresses to this machine are:\n\n"
ip address
read IN_NONE
clear

# [i] Restore original sshd configuration and stop service.
systemctl stop sshd
mv /root/sshd_config_original /etc/ssh/sshd_config

for PKG in "${PACKAGES[@]}"
do
	chmod +x /root/Archdrive/packages/$PKG/install.sh
	/root/Archdrive/packages/$PKG/install.sh
done

# [DEV] TODO: Remove git repo after installation.
