#!/bin/bash

# ###############################################################################
# Roterum Archdrive - Archlinux Install
# This script installs arch linux onto the given drife, setted up for Roterum.
# ###############################################################################


# [>] Download


# [i] Download variables, prepare, chroot, locales and mkinitcpio for archdrive installation.
# wget https://raw.githubusercontent.com/Roterum/Archdrive/master/archlinux-install-variables.sh --output-document=./archlinux-install-variables.sh
# wget http://blah --output-document=./archlinux-install-prepare.sh
# wget http://blah --output-document=./archlinux-install-chroot.sh
# wget http://blah --output-document=./archlinux-install-locales.gen
# wget http://blah --output-document=./archlinux-install-mkinitcpio.conf


# [>] Configure

# [i] Prompt user to edit installation variables.
printf "Press [ENTER] to configure installation variables. After closing the document, the installation of the system will start."
read IN_NONE
nano ./archlinux-install-variables.sh

# [i] Add configuration to prepare script.
cat ./archlinux-install-variables.sh > ./archlinux-install-prepare_temp.sh
printf $"\n" >> ./archlinux-install-prepare_temp.sh
cat ./archlinux-install-prepare.sh >> ./archlinux-install-prepare_temp.sh
mv ./archlinux-install-prepare_temp.sh ./archlinux-install-prepare.sh

# [i] Add configuration to chroot script.
cat ./archlinux-install-variables.sh > ./archlinux-install-chroot_temp.sh
printf $"\n" >> ./archlinux-install-chroot_temp.sh
cat ./archlinux-install-chroot.sh >> ./archlinux-install-chroot_temp.sh
mv ./archlinux-install-chroot_temp.sh ./archlinux-install-chroot.sh