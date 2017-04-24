#! /bin/sh

# Launch mpd and ncmpcpp
if [ $(pgrep -cx mpd) -gt 0 ] ; then
    ncmpcpp
else
    mpd && ncmpcpp
fi
