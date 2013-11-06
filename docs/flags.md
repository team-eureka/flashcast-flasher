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
