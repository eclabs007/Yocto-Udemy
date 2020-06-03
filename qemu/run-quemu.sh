#!/bin/bash

if [ $# -ne "1" ]
then
echo "ERROR: Usage $0 Image_name"
exit
fi
IMG=$1
KERNEL=kernel-qemu-rpi
test -f $IMG && test -f $KERNEL || { echo "$IMG or $KERNEL not found"; exit; }

# prepare the image
SEC2=$( fdisk -l $IMG | grep Linux | awk '{ print $2 }' )
OFF2=$(( SEC2 * 512 ))
mkdir -p tmpmnt
sudo mount $IMG -o offset=$OFFSET2 tmpmnt
cat > tmpmnt/etc/udev/rules.d/90-qemu.rules <<EOF
KERNEL=="sda", SYMLINK+="mmcblk0"
KERNEL=="sda?", SYMLINK+="mmcblk0p%n"
KERNEL=="sda2", SYMLINK+="root"
EOF
umount -l tmpmnt
rmdir tmpmnt &>/dev/null

qemu-system-arm -kernel $KERNEL -cpu arm1176 -m 256 -M versatilepb  \
				-no-reboot -append "root=/dev/sda2 panic=1" -drive format=raw,file=$IMG \

