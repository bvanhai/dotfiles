#!/bin/sh
# https://bbs.archlinux.org/viewtopic.php?id=80145&p=7

FONT="DejaVu Sans Mono:pixelsize=12:antialias=true:rgba=rgb"
BGCOL="#3f3f3f"
FGCOL="#dcdccc"
SELBGCOL="#7F62B3"
SELFGCOL="#dcdccc"

COMMANDS="
suspend\n
poweroff\n
reboot\n
hibernate\n
hybrid-sleep\n
halt\n
lock\n
"

command=$(echo -e $COMMANDS | \
    dmenu -p "Power:" -fn "$FONT" -nb $BGCOL -nf $FGCOL -sb $SELBGCOL -sf $SELFGCOL)
[ "$command" = "" ] && exit 1
systemctl $command && exit 0

