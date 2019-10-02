#!/usr/bin/bash
set -exo pipefail

# save stdout and stderr to file descriptors 3 and 4, then redirect them to "foo"
exec 3>&1 4>&2 >/tmp/last-goes-run.log 2>&1

curl https://cdn.star.nesdis.noaa.gov/GOES16/ABI/CONUS/GEOCOLOR/2500x1500.jpg \
     2>/dev/null > /opt/goes/.goes-wallpaper.jpg \
    && DISPLAY=:0 gsettings set \
	      org.gnome.desktop.background picture-uri file:///opt/goes/.goes-wallpaper.jpg

# restore stdout and stderr
exec 1>&3 2>&4
