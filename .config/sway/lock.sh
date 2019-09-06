#!/bin/bash
image_lock=/tmp/lock.png
rm -rf $image_lock
grim -t jpeg -q 50 - | convert - -define png:compression-level=1 -scale 10% -blur 0x2.5 -resize 1000% $image_lock
swaylock -i $image_lock
