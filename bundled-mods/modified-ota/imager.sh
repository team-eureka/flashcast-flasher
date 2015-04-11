set -e

if ! test "$#" -ge 1 -a -f "$1" ; then
	fatal "Invalid argument"
fi

OTA_PATH="$(mktemp -d)"
log "Extracting ota.zip to ${OTA_PATH}"
unzip -d "$OTA_PATH" "$1"

log "Flashing Kernel"
flash_mtd_partition kernel "${OTA_PATH}/boot.img"

log "Flashing System"
flash_mtd_partition rootfs "${OTA_PATH}/system.img"

log "Starting System Modification"
ROOTFS="$(begin_squashfs_edit 'rootfs')"

log "Replacing Stock Recovery"
rm "${ROOTFS}/boot/recovery.img"
dd if=/dev/mtdblock6 of="${ROOTFS}/boot/recovery.img" #Dirty but functional

log "Adding Busybox"
cp "./busybox" "${ROOTFS}/bin/"

log "Enabling Telnet Access"
rm "${ROOTFS}/bin/sntpd"
echo -e '#!/bin/sh\n/system/bin/busybox telnetd -l /system/bin/sh\n/bin/toolbox sntpd' > "${ROOTFS}/bin/sntpd"

Log "Done Editing, Writing Changes"
end_squashfs_edit "$ROOTFS"

log "OTA Complete!"