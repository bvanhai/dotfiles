#! /bin/sh

# mpd toggle
if [ $(pgrep -cx mpd) -gt 0 ] ; then
    kill -9 $(ps aux | grep mpd | sed 's/\s\+/ /g' | cut -d' ' -f2 | xargs)
else
    mpd &
fi
