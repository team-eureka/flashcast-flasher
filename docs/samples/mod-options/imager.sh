# Fail immediately if any step fails.
set -e

# Print the contents of the mod_options file.
cat mod_options

# Check various options
if has_mod_option 'flag1' ; then
	echo "flag1 is set!"
fi

# has_mod_option works regardless of $PWD
cd temp

if has_mod_option 'flag2' ; then
	echo "flag2 is set!"
fi
