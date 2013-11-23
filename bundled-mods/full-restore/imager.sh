set -e

if test -z "$1" ; then
        fatal "No Backup Folder Defined in full_backup"
fi

# $1 should be the folder number of your backup, ex 1 for ./backup-1
# it should NOT be a full path!

restore_mtd_partition 'rootfs' "$1"

restore_mtd_partition 'kernel' "$1"

restore_mtd_partition 'recovery' "$1"

restore_mtd_partition 'userdata' "$1"