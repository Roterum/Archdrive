#!/bin/bash

source /root/archlinux-install-variables.sh

# [>] User Configuration


# [i] Create new user for roterum.
useradd -m -G sudo $USERNAME

# [i] Create user directory on drive.
mkdir /drive/$USERNAME
ln -s /drive/$USERNAME/ /home/$USERNAME/Drive

# [i] Set user password.
echo $USERNAME:$PASSWD_USER | chpasswd


# [>] Packages


# [i] Run package installation scripts.
/root/archlinux-install-packages.sh



# [>] Cleanup
