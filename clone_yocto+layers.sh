#!/bin/sh
#
#ineclabs.com yocto_download script
#
#
echo "Downloading Poky"
git clone -b zeus git://git.yoctoproject.org/poky.git poky-zeus
cd poky-zeus ;

echo "Downloading Meta-Layers"
git clone -b zeus git://git.openembedded.org/meta-openembedded
git clone -b zeus git://git.yoctoproject.org/meta-raspberrypi

echo "Enjoy building your own Linux "
echo "For more, visit  http://ineclabs.com/"
