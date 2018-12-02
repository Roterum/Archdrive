Download deploy script: https://goo.gl/jFiPnG (`wget https://goo.gl/jFiPnG --output-document=./archlinux-install.sh`)

Installed packages: `base base-devel grub`

Enabled services: `dhcpcd`

Uncommented locale: `en_GB.UTF-8 UTF-8` `de_CH.UTF-8 UTF-8`

Changed mkinitcpio: added `block` after `udev` in hooks array


To install the environment, start `/root/archlinux-install-packages.sh` after booting into the new system. This will also clean up the previous installation files.

This script will install `openssh` and `git`.

NOTE: During package configuration, the system is accessible over ssh to root.

Packages to be installed in `./packages` require the `packages/<pkgname>/install.sh` script which will be executed for the installation.
