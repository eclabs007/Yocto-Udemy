SUMMARY = "recipe for image"
DESCRIPTION = "CustomImage"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
include recipes-core/images/core-image-base.bb

IMAGE_FEATURES += "\
nfs-server \
"

IMAGE_INSTALL += "\
rsync \
ntfs-3g-ntfsprogs \
fuse-exfat \
"

# Configure timezone
IMAGE_INSTALL += "tzdata-europe tzdata"

# Add ssh
IMAGE_FEATURES += " ssh-server-dropbear"

# Add support for wifi and bluetooth
IMAGE_INSTALL += "linux-firmware-bcm43430"

# Add mount.nfs
IMAGE_INSTALL += "nfs-utils"

# Add Network Manager
IMAGE_INSTALL += "networkmanager networkmanager-bash-completion networkmanager-nmtui"
IMAGE_INSTALL_append = " pulseaudio pulseaudio-server pulseaudio-misc pulseaudio-module-dbus-protocol alsa-utils i2c-tools"
# Only produce the "rpi-sdimg" image format
IMAGE_FSTYPES = "rpi-sdimg"
# Remove old builds
RM_OLD_IMAGE = "1"

IMAGE_INSTALL_append = " systemd-analyze"

# Install kodi Demo for Udemy course Yocto Zero To Hero 

IMAGE_INSTALL += "kodi \
kodi-ec-config \
libavcodec \
libavfilter \
libavformat \
libavutil \
libswscale \
libswresample \
"
ENABLE_UART = "1" 
ENABLE_BINARY_LOCALE_GENERATION = "1"
