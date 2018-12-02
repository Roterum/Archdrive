#!/bin/bash

source /root/archlinux-install-variables.sh

# [>] User Configuration

# [i] Create new user for roterum.
useradd -m $USERNAME

# [i] Add user to sudoers.
gpasswd -a $USERNAME sudo

# [i] Set user password.
echo $USERNAME:$PASSWD_USER | chpasswd


# [>] Packages


# [i] Run package installation scripts.
/root/archlinux-install-packages.sh



# [>] Cleanup
