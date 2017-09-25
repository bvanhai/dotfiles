#! /bin/sh

# Launch mpd and ncmpcpp
if [ $(pgrep -cx ncmpcpp) -gt 0 ] ; then
    pkill ncmpcpp
fi

if [ $(pgrep -cx mpd) -gt 0 ] ; then
    urxvt -name ncmpcpp -e ncmpcpp
else
    mpd && urxvt -name ncmpcpp -e ncmpcpp
fi
