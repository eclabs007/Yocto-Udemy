#!/bin/bash
#Run as Sudo
##Please Use the correct SD card device
#use fdisk -l to list the devices
if [ "$#" -ne  1 ];then
echo "[ERROR] usage: $0 sdx "
exit 
fi
if [ $EUID -ne 0 ]; then
echo "You must be a root user" 2>&1
exit 1
fi
MMC=$1
umount /dev/${MMC}*

#creating partition

parted -s /dev/${MMC} \
mklabel msdos \
mkpart primary fat32 1M 100M \
mkpart primary ext4 100M 100%

#create File system

mkfs.vfat /dev/${MMC}1
mkfs.ext4 /dev/${MMC}2

fatlabel /dev/${MMC}1 BOOT
e2label /dev/${MMC2} ROOT
mkdir /media/BOOT
mkdir /media/ROOT
mount /dev/${MMC1} /media/BOOT
mount /dev/${MMC2} /media/BOOT
