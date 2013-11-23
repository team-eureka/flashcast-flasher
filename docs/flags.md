Flag files
==========

As well as the `eureka_image` directory, `eureka_image.zip` file, and
`flashcast-mods` directory, the user partition will be checked for several
flag files whose presence change the behavior of FlashCast. The contents of
the files are ignored; all that matters is whether or not they exist. The
supported flag files are listed below:

- `dry_run`: If present, built-in helper functions which would normally be
    destructive will not instead print a log message detailing what they would
    have done. **This does not affect calls to destructive system utilities
    which don't go through a helper function.**
- `ignore_errors`: If present and `flashcast-mods` is being used, an error in
    a single mod won't halt the entire flashing process.
- `no_reboot`: If present, FlashCast will not reboot the device after a
    successful flash.
- `full_backup`: If present, FlashCast will backup the System, Recovery, Kernel, and
    UserData partitions into a folder called `flashcast-backups` before any mods are flashed.
    This feature should **ONLY** be used by developers. This feature is currently in Alpha, and
    should not be relied on at this time.
- `full_restore`: If present, FlashCast will restore a backup that was made with the `full_backup` flag.
    When this file is created, please place a number in the file, ex 1, to tell flashcast which backup to restore.
    For example, if the backup you want to restore is in `flashcast-backups/backup-2/` then you would put `2` inside of 
    `full_restore`.
    This feature should **ONLY** be used by developers. This feature is currently in Alpha, and
    should not be relied on at this time.