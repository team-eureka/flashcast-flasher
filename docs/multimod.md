Flashing multiple mods
======================

If neither the `eureka_image` directory nor the `eureka_image.zip` file is
present, FlashCast will check for a directory named `flashcast-mods`. If this
directory is present, every file and directory inside it will be flashed in
alphabetical order. This is the recommended way to flash mods, as it lets you
give your mods meaningful names. When you distribute a mod, its name should be
of the format "XXdescription.zip". "XX" should be a two digit number selected
from the list below according to how much of the system the mod affects. For
example, `20rooted13300.zip`. Please do not use any numbers which aren't listed,
as they are reserved for future use. If your mod doesn't fit into any of the
categories, feel free to open a pull request to add a new entry.

- `20`: Full system rewrites. For example, a rooted image or alternate OS.
- `50`: Significant filesystem changes. For example, a system-wide HTTP proxy.
- `80`: Minor filesystem changes. For example, disabling updates.
