#!/bin/sh

# It's possible to bundle multiple mods into one by calling the "flash-image"
# script on each sub-mod.

flash-image 'mod-1'
flash-image 'mod-2'

# Since mod #2 fails, its exit status will fall through to this script.
