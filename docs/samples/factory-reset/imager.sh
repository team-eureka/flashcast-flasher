# Fail immediately if any step fails.
set -e

# To perform a factory reset, we need to wipe the Chromecast's data partition.
# Luckily, there's already a helper function to do that for us:

clear_data

# That's it!
