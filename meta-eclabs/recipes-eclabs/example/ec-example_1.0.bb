DESCRIPTION="Example helloworld from eclabs"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
#SRC_URI = "file://hello.c"
SRC_URI= "git://github.com/eclabs007/udemy-example.git;protocol=https"
SRCREV = "${AUTOREV}"

S = "${WORKDIR}/git/"
do_compile(){
				${CC} hello.c -o hello ${LDFLAGS}
}

do_install(){
			install -d ${D}${bindir}
			install -m 0777 hello   ${D}${bindir}/
}
