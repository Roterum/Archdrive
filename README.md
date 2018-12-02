Download deploy script: https://goo.gl/jFiPnG (`wget https://goo.gl/jFiPnG --output-document=./archlinux-install.sh`)

Installed packages: `base base-devel grub openssh wget git`

Enabled services: `dhcpcd`

Uncommented locale: `en_GB.UTF-8 UTF-8` `de_CH.UTF-8 UTF-8`

Changed mkinitcpio: added `block` after `udev` in hooks array

NOTE: All users of the group `sudo` are super users.


After rebooting the system, run `/root/archlinux-install-setup.sh` to finish the installation and install additional packages. This will also clean up the installation files.

NOTE: During package configuration, the system is accessible over ssh to root.

Packages to be installed in `./packages` require the `packages/<pkgname>/install.sh` script which will be executed for the installation.
