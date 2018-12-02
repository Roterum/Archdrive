#!/bin/bash

source /root/archlinux-install-variables.sh


# [>] Install


# [i] Download X packages.
pacman -Sy --noconfirm mate


# [>] Setup


# [i] Configure new xinit.
cp /root/Archdrive/packages/mate/xinitrc /home/$USERNAME/.xinitrc
