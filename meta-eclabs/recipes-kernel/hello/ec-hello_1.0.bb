#
# Yocto recipe to build a kernel module out of the kernel tree
#

DESCRIPTION = "Hello kernel module out of the kernel tree"
SECTION = "examples"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

PR = "r0"

S = "${WORKDIR}"
inherit module

SRC_URI =   "file://hello.c \
						 file://Makefile \
						 "
