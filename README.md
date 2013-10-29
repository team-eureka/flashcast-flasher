flashcast-flasher is the set of shell scripts which power FlashCast's mod
framework. It began as part of the eureka_buildroot repository in the
`fs-overlay_flasher` overlay directory, but was split out into its own
package as it grew.

Scripts
-------

- `flasher`: This script gets run at boot to detect images on a partition, flash
    them, and reboot the device.
- `flash-image`: This script is what actually flashes a mod. It extracts the mod
    (if needed), copies it to a temporary directory, defines a set of helper
    functions, and then execs `imager.sh` in the same shell environment.

Bundled Mods
------------

There are also a set of mods which ship with FlashCast and are called by
`flasher` to perform various tasks. These are stored in `bundled-mods`:

- `gtvhacker-compat`: This mod is run when a legacy GTVHacker-named image is
    detected. It simply writes the file passed to it to the `rootfs` MTD
    partition.
- `init-partitions`: If the `init_partitions` flag file is present on the mod
    partition, this mod is run and the device is immediately rebooted. This mod
    expands the first partition on /dev/sda to fill the disk and creates a blank
    FAT filesystem on it. FlashCast's released USB images are the only images
    which make use of the flag file at this time.
- `iterate-images`: This mod is run when a `flashcast-mods` directory is
    detected. It flashes every mod inside the directory passed to it.
- `remove-ota`: This mod is run on every FlashCast boot. It removes `ota.zip`
    and `temp-ota.zip` from the cache MTD partition in case an update was
    partially downloaded by the stock OS.
