#!/bin/bash

# the language is written to ./.kbd-layout
LAYOUTFILE="$HOME/.kbd-layout"

# define two languages
LANG1="us"
LANG2="dk"

# make the caps lock key a ctrl key
#OPTS="-option ctrl:nocaps,altwin:swap_lalt_lwin"
OPTS="-option ctrl:nocaps"

# write the file if it doesn't exist
if [ ! -f $LAYOUTFILE ]; then
    echo 'echo "us" > $LAYOUTFILE'
    echo "us" > $LAYOUTFILE
    setxkbmap $LANG1 $OPTS
    xmodmap ~/.Xmodmap
    notify-send $LANG1
    exit
fi

# read the language file, and switch to the other language
CURRLANG="`cat $LAYOUTFILE`"

if [ "$CURRLANG" == "$LANG1" ]; then
    echo $LANG2 > $LAYOUTFILE
    setxkbmap $LANG2 $OPTS
    notify-send $LANG2
    xmodmap ~/.Xmodmap
else
    echo $LANG1 > $LAYOUTFILE
    setxkbmap $LANG1 $OPTS
    notify-send $LANG1
    xmodmap ~/.Xmodmap
fi
