#!/bin/sh

# In this sample, boot.img and system.img are empty. In a real mod, they would
# contain an Android boot image (prepared using cc-mangle-bootimg) and a
# squashfs root filesystem, respectively.

flash_mtd_partition 'rootfs' 'system.img'
flash_mtd_partition 'kernel' 'boot.img'
