set -e

CleanupTime() {
	rm -r $OTA_PATH
}

log "Checking for any Flashcast AutoRoot Updates..."

wget -T2 -q -s http://pdl.team-eureka.com
if [ $? -eq 0 ]; then
    log "Internet Connection Found, Checking..."

	LATESTVER=`wget -q http://pdl.team-eureka.com/recovery/latest.txt -O -`
	CURRENTVER='cat /usr/share/flasher/autoroot-ota/version.txt'

	if [ "`echo $LATESTVER | awk '{print $1}'`" == "$CURRENTVER" ]; then
		log "No Update needed, exiting..."
	else
		log "Update Required! Upgrading..."

		OTA_PATH="$(mktemp -d) "
		OTA_DL=`echo $LATESTVER | awk '{print $2}'`

		wget -q "$OTA_DL" -O "${OTA_PATH}/recovery.img"
		if [ $? -ne 0 ];
		then
			pLog "Error Downloading! Skipping update, and continuing on..."
			CleanupTime
			exit 0
		else
		fi

		wget -q "$OTA_DL.md5" -O "${OTA_PATH}/recovery.img.md5"
		if [ $? -ne 0 ];
		then
			pLog "Error Downloading MD5! Skipping update, and continuing on..."
			CleanupTime
			exit 0
		else

		MD5=`md5sum $OTA_PATH/recovery.img | awk '{print $1}'`
		if grep -q "$MD5" "$OTA_PATH/recovery.img.md5"; then
			pLog "MD5 Verified Flashing and restarting!"
			flash_mtd_partition recovery "${OTA_PATH}/recovery.img"
			sync
			set-boot-cmd recovery
			reboot
			sleep 120
		else
			pLog "MD5 Mismatch! Skipping update, and continuing on..."
			CleanupTime
			exit 0
		fi
	fi
else
    log "No connection found, continuing with flash process..."
fi
exit 0
