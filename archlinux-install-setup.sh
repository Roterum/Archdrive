#!/bin/bash

source /root/archlinux-install-variables.sh

# [>] User Configuration

# [i] Create new user for roterum.
useradd -m -G sudo $USERNAME

# [i] Create user directory on drive.
mkdir /drive/$USERNAME
printf $"# [i] Archdrive - Mount drive folder.\n" >> /home/$USERNAME/.bash_login
printf $"ln -s /home/$USERNAME/Drive /drive/$USERNAME\n" >> /home/$USERNAME/.bash_login
chown $USERNAME:$USERNAME /home/$USERNAME/.bash_login

# [i] Set user password.
echo $USERNAME:$PASSWD_USER | chpasswd


# [>] Packages


# [i] Run package installation scripts.
/root/archlinux-install-packages.sh



# [>] Cleanup
