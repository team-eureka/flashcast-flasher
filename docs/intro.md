An introduction to writing FlashCast mods
=========================================

What is FlashCast?
------------------

FlashCast is a USB image which makes it easy to mod the Google Chromecast for
both users and developers. It relies on the bootloader unsigned code execution
exploit present only in build 12072, and so can not be run on new devices or
those which have auto-updated.

What is a mod?
--------------

Put simply, a "mod" is anything which performs some alteration to a Chromecast's
internal memory. It can be as simple as replacing the stock boot animation, or
as complex as installing an entirely new OS to the device. A FlashCast mod is
usually districuted as a `.zip` file, which contains all the files which the mod
needs to use bundled with a shell script which describes how the files should be
installed. Please refer to `files.md` to see how a mod should be structured.

How does my mod get installed?
------------------------------

Users interact with FlashCast by copying files to and from a FAT partition which
occupies most of the USB drive. This partition is called the "user partition"
and contains your mod as well as several flag files (see `flags.md`). When
FlashCast boots up, it checks the user partition for a file named
`eureka_image.zip`, and installs a mod from it if it is present. Alternatively,
several mods can be flashed at once using the `flashcast-mods` directory. See
`multimod.md` for more informarion.
