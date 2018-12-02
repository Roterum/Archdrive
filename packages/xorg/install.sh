#!/bin/bash


# [>] Install


# [i] Download X packages.
pacman -Sy --noconfirm xorg-server xorg-xinit


# [>] Setup


# [i] Overwrite global xinitserverrc.

printf $"#!/bin/sh" > /etc/X11/xinit/xserverrc
printf $"exec /usr/bin/Xorg -nolisten tcp "\$\@" vt\$XDG_VTNR" > /etc/X11/xinit/xserverrc
