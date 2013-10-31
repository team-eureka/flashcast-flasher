# FlashCast has helpers which let it unpack and repack a squashfs image on-the
# fly! If your mod makes simple changes to the rootfs and you don't want to
# provide a different mod for each firmware version, these helpers are for you.

# Start the modification.
ROOTFS="$(begin_squashfs_edit 'rootfs')"

# No updating for you!
rm "${ROOTFS}/chrome/update_engine"

# Clean up and write the modified partition back. There's no need to provide
# the partition name -- FlashCast remembers!
end_squashfs_edit "$ROOTFS"
