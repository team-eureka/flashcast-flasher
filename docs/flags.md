Flag files
==========

As well as the `eureka_image` directory and `eureka_image.zip` file, the user
partition will be checked for several flag files whose presence change the
behavior of FlashCast. The contents of the files are ignored; all that matters
is whether or not they exist. The supported flag files are listed below:

- `no_reboot`: If present, FlashCast will not reboot the device after a
    successful flash.
- `dry_run`: If present, built-in helper functions which would normally be
    destructive will not instead print a log message detailing what they would
    have done. **This does not affect calls to destructive system utilities
    which don't go through a helper function.**
