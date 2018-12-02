#!/bin/bash


# [>] Install


# [i] Download X packages.
pacman -Sy --noconfirm xorg-server xorg-xinit


# [>] Setup


# [i] Configure global xinit.

cp /root/Archdrive/packages/xorg/xinitrc /etc/X11/xinit/xinitrc
cp /root/Archdrive/packages/xorg/xserverrc /etc/X11/xinit/xserverrc