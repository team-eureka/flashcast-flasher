set -e

CleanupTime() {
	rm -r $OTA_PATH
}

log "Checking for any Flashcast AutoRoot Updates..."

wget -T2 -q -s http://pdl.team-eureka.com
if [ $? -eq 0 ]; then
    log "Internet Connection Found, Checking..."

	LATESTVERURL=`wget -q http://pdl.team-eureka.com/recovery/latest.txt -O -`
	VALIDCHECK=`echo $LATESTVERURL | awk '{ print $1 }'`
	LATESTVER=`echo $LATESTVERURL | awk '{ print $2 }'`
	CURRENTVER=`cat /usr/share/flasher/autoroot-ota/version.txt`

	# We need to first make sure we are getting an update file!
	if [[ "$VALIDCHECK" != "flashcast-autoupdate" ]] ; then
		log "Unable to pull update information! Exiting..."
		exit 0
	fi

	if grep -q "$CURRENTVER" <<< "$LATESTVER" ; then
		log "No Update needed, exiting..."
	else
		log "Update Required! Upgrading..."

		OTA_PATH="$(mktemp -d)"

		wget -q "$LATESTVER" -O "${OTA_PATH}/recovery.img"
		if [ $? -ne 0 ];
		then
			log "Error Downloading! Skipping update, and continuing on..."
			CleanupTime
			exit 0
		fi

		wget -q "$LATESTVER.md5" -O "${OTA_PATH}/recovery.img.md5"
		if [ $? -ne 0 ];
		then
			log "Error Downloading MD5! Skipping update, and continuing on..."
			CleanupTime
			exit 0
		fi

		MD5=`md5sum $OTA_PATH/recovery.img | awk '{print $1}'`
		if grep -q "$MD5" "$OTA_PATH/recovery.img.md5"; then
			# Touch OTA file, tells flashcast to reboot into RECOVERY next run
			touch /tmp/flashcast.update

			log "MD5 Verified Flashing and restarting!"
			flash_mtd_partition recovery "${OTA_PATH}/recovery.img"
			sleep 5
			reboot
			sleep 120 # just to make sure
		else
			log "MD5 Mismatch! Skipping update, and continuing on..."
			CleanupTime
			exit 0
		fi
	fi
else
    log "No connection found, continuing with flash process..."
fi
exit 0
