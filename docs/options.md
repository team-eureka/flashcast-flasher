Mod options
===========

FlashCast allows the user to pass an options file to your mod to configure
runtime behavior. This options file must be provided in the same place as
your mod and named the same as the mod with `.options` appended. For example,
if your mod is named `20rooted1330.zip`, its corresponding options file should
be called `20rooted1330.zip.options`. This options file will be copied into the
root directory of your mod when it is flashed with the filename `mod_options`.

This file can be in any format you want, but its recommended format is a plain
text file consisting of a single flag on each line. If you use this format, the
`has_mod_option` helper function can be used to easily check for the presence
of a given flag.
