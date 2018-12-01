#!/bin/bash

# ###############################################################################
# Roterum Archdrive - Archlinux Install
# ###############################################################################


# [>] Download


# [i] Download variables, chroot, locales and mkinitcpio for archdrive installation.
# wget http://blah --output-document=./archlinux-install-variables.sh
# wget http://blah --output-document=./archlinux-install-chroot.sh
# wget http://blah --output-document=./archlinux-install-locales.gen
# wget http://blah --output-document=./archlinux-install-mkinitcpio.conf


# [>] Configure

# [i] Prompt user to edit installation variables.
printf "Press [ENTER] to configure installation variables. After closing the document, the preparation and installation of the system will start."
read IN_NONE
nano ./archlinux-install-variables.sh


