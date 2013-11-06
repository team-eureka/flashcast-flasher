Logging
=======

When FlashCast boots up, a log file is saved to `/root/flashcast.log`. This log
file can be accessed through SSH and is mostly useful in conjunction with the
`no_reboot` flag file (see `flags.md`). In addition, a copy of the log file is
saved to the user partition, with the name `flashcast-logs/flashcast-N.log`,
where `N` is the next available number. This copy is not made if the user
partition uses a read-only filesystem such as squashfs.
