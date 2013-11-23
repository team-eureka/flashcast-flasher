set -e

backup_mtd_partition 'rootfs'

backup_mtd_partition 'kernel'

backup_mtd_partition 'recovery'

backup_mtd_partition 'userdata'