FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"

SRC_URI += "\
file://advancedsettings.xml \
file://guisettings.xml \
"
KODI_DESTINATION="/root/.kodi/userdata"
S = "${WORKDIR}/"

do_install() {
        install -d ${D}${KODI_DESTINATION}
        install -m 0644  ${S}/advancedsettings.xml  ${D}${KODI_DESTINATION}
	install -m 0644  ${S}/guisettings.xml  ${D}${KODI_DESTINATION}

}


#install -d "${D}${systemd_unitdir}/system"
#install -m 0644 ${S}/kodi-custom.service ${D}/${systemd_unitdir}/system/
#inherit systemd
#SYSTEMD_SERVICE_${PN} = "kodi-custom.service"
PR = "r0"
FILES_${PN}+="${KODI_DESTINATION}/*"


