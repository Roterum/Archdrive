Download deploy script: https://goo.gl/jFiPnG (`wget https://goo.gl/jFiPnG --output-document=./archlinux-install.sh`)

Installed packages: `base base-devel grub git openssh`

NOTE: During additional package configuration, the system is accessible over ssh to root.

Uncommented locale: `en_GB.UTF-8 UTF-8` `de_CH.UTF-8 UTF-8`

Changed mkinitcpio: added `block` after `udev` in hooks array

Packages to be installed in `./packages` require the `packages/<pkgname>/install.sh` script which will be executed for the installation.