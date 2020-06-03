SUMMARY = "Eclabs modifying config "


do_deploy_append(){
				echo "hdmi_force_hotplug=1" >>${DEPLOYDIR}/bcm2835-bootfiles/config.txt
				echo "hdmi_drive=2" >>${DEPLOYDIR}/bcm2835-bootfiles/config.txt
				echo "max_usb_current=1" >>${DEPLOYDIR}/bcm2835-bootfiles/config.txt
				echo "dtparam=audio=on" >>${DEPLOYDIR}/bcm2835-bootfiles/config.txt
				echo "enable_uart=1" >>${DEPLOYDIR}/bcm2835-bootfiles/config.txt
}
