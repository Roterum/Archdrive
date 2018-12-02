
# [i] Disk to install archlinux on.
DRIVE=$"/dev/sdx"

# [i] Parted start and end position of root (/).
DRIVE_ROOT_START=$"2MiB"
DRIVE_ROOT_END=$"50GiB"

# [i] Parted start and end position of home directories.
DRIVE_HOME_START=$"50GiB"
DRIVE_HOME_END=$"\"-4GiB\""

# [i] Parted start and end position of SWAP ppartition.
DRIVE_SWAP_START=$"\"-4GiB\""
DRIVE_SWAP_END=$"100%"

# [i] Archdrive user and hostname.
USERSHORT=$"eq"
USERNAME=$"pr-$USERSHORT"
HOSTNAME=$"pr-archdrive-$USERSHORT"

# [i] Packages to pacstrap install.
INSTALLPKG="base base-devel"

# [i] Zoneinfo directory to configure.
ZONEINFO="UTC"

# [i] Vconsole keymap value.
VCONKM="uk"

# [>] LANG variable value in locale.
LOCLANG="en_GB.UTF-8"
