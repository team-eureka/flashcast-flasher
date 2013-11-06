The file layout of a mod
========================

The root directory
------------------

The "root directory" of a mod is the single directory which contains all the
mod's data files and imager scripts. When you distribute your mod, you will pack
the contents of this directory into a `.zip` file. During development, however,
you may simply place the uncompressed directory on FlashCast's user partition
with the name `eureka_image` or inside `flashcast-mods` with any name. Note
that if a `eureka_image.zip` file is present, it will be used instead of any
`eureka_image` directory which may also be present.

Data files
----------

A "data file" is any file in your mod's root directory which is not a script
(see below). Replacement configuration files, new background images, and even
full squashfs images are all examples of data files. You have complete control
over the directory layout of data files in your mod. As long as your data files
are somewhere in your mod's root directory, your imager script will be able to
access them.

The imager script
-----------------

The core of a mod is its imager script. This script contains shell commands
that are executed to install the mod. The script must be placed directly in
the root directory and be named `imager.sh`.

When your mod is installed, `imager.sh` is executed by `bash` in a shell
environment which has the FlashCast helper functions pre-defined (see
`helpers.md`). Since FlashCast v1.1, `imager.sh` no longer needs to be marked
executable.

`imager.sh` is executed from your mod's root directory. To reference a data
file, simply use its relative path from your root directory. If you wish, you
may also bundle other scripts with your mod and source them from `imager.sh`.
(If you don't use source, you will lose access to the helper functions.)
However, most mods are simple enough to only require `imager.sh` and any
associated data files.

The mod options file
--------------------

When your mod is flashed, the user can give it a file containing runtime
options. If present, this file will be named `mod_options` and contained
in the mod's root directory. See `options.md` for more information.
