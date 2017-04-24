#!/bin/bash

LAPTOPSCR=eDP1
EXTSCR=DP1
#PROJECTOR=

# default monitor is LVDS1
MONITOR=$LAPTOPSCR

# functions to switch from LVDS1 to VGA and vice versa
function ActivateEXT {
    #echo "Switching to EXTSCR"
    xrandr --output $EXTSCR --auto --output $LAPTOPSCR --off
    ~/bin/wallpaper.sh
    MONITOR=$EXTSCR
    #notify-send "Activating $EXTSCR"
}
function DeactivateEXT {
    #echo "Switching to $LAPTOPSCR"
    #xrandr --output $EXTSCR --off --output $LAPTOPSCR --auto
    xrandr --auto
    ~/bin/wallpaper.sh
    MONITOR=$LAPTOPSCR
    #notify-send "Activating $LAPTOPSCR"
}

# functions to check if EXT is connected and in use
function EXTActive {
    [ $MONITOR = "$EXTSCR" ]
}
function EXTConnected {
    ! xrandr | grep "^$EXTSCR" | grep disconnected
}

#while true
#do
if ! EXTActive && EXTConnected
then
    ActivateEXT
fi

if EXTActive && ! EXTConnected
then
    DeactivateEXT
fi

#sleep 5s
#done
