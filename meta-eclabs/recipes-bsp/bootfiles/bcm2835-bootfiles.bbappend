SUMMARY = "Eclabs creating bcm2711-bootfiles in  deploy directory also contains overlays "

BCM2711_DIR = "bcm2711-bootfiles"

do_after_deploy() {
#it is not needed but just for creating a folder in soc name we created it
    install -d ${DEPLOY_DIR_IMAGE}/${BCM2711_DIR}

    for i in ${S}/*.elf ; do
        cp $i ${DEPLOY_DIR_IMAGE}/${BCM2711_DIR}
    done
    for i in ${S}/*.dat ; do
        cp $i ${DEPLOY_DIR_IMAGE}/${BCM2711_DIR}
    done

    cp -r ${RPIFW_S}/boot/overlays/ ${DEPLOY_DIR_IMAGE}/${BCM2711_DIR}/overlays


}

addtask after_deploy before do_build after do_install do_deploy
