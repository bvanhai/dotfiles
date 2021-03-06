#!/bin/sh

# Don't suspend when these are running
WHITELIST=("make" "pacman" "yaourt" "emerge" "mpv")
# Don't lock screen when these are running
SCREENONLIST=("mpv")
# Don't lock screen when an app is fullscreen ****BSPWM ONLY****
SCREENONFULLSCREEN=true
# Don't suspend if MPD server is playing music
CANCELONMUSIC=true
# Don't change unless you know what you are doing
STATEFILE=/tmp/xautolock.state

# START SCRIPT
STATE=`cat $STATEFILE`
CANCEL=FALSE
# Check Statefile for notification state
if [[ $STATE == "disabled" ]]; then
    # echo "mode disabled"
    exit 0
fi

# Check if screenon programs are running
for i in ${SCREENONLIST[@]}; do
    pgrep $i > /dev/null 2>&1
    # if we find one exit script
    if [ "$?" == "0" ]; then
        # echo "found screenon"
        exit 0
    fi
done

# Check if any app is fullscreen
if [[ $SCREENONFULLSCREEN == true ]]; then
    # this checks the bspc tree for a window with the fullscreen flag. Could be modified to search for any other of the flags shown.
    bspc query -T | grep '[f-][d-][F][u-][l-][s-][i-][p-]' > /dev/null 2>&1
    # if we find one exit script
    if [ "$?" == "0" ]; then
        # echo "found fullscreen"
        exit 0
    fi
fi

# Check if whitelist programs are running
for i in ${WHITELIST[@]}; do
    pgrep $i > /dev/null 2>&1
    if [ "$?" == "0" ]; then
        CANCEL=true
    fi
done

# Check for MPD server playing music
if [[ $CANCELONMUSIC == true ]]; then
    MPD_RAW="$(mpc)"
    MPD_STATE="$(echo "$MPD_RAW" | head -n 2 | tail -n 1 | awk '{gsub("\\[", ""); gsub("\\]", ""); print $1}')"
    if [[ $MPD_STATE == "playing" ]]; then
        CANCEL=true
    fi

fi

# Execute Options
if [[ $CANCEL == true ]]; then
    sleep 2s;
    xset dpms force off;
    feh --randomize --bg-fill /home/Data/Wallpaper/*
    killall -SIGUSR1 dunst # pause
    /usr/bin/sxlock -f -*-terminus-*-r-*-*-32-*-*-*-*-*-*-*
    killall -SIGUSR2 dunst # resume
else
    feh --randomize --bg-fill /home/Data/Wallpaper/*
    if [ -f /usr/sbin/s2ram ]; then
        sudo s2ram
    else
        systemctl suspend
    fi
fi
