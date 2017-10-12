#!/bin/sh
# https://bbs.archlinux.org/viewtopic.php?id=80145&p=7

FONT="Inconsolata-g:pixelsize=13:antialias=true:rgba=rgb"
BGCOL="#000000"
FGCOL="#9999CC"
SELBGCOL="#000066"
SELFGCOL="#FFFFFF"

command_exists() {
    local command="$1"
    type "$command" >/dev/null 2>&1
}

if command_exists "s2ram"; then
    COMMANDS="
    s2ram\n
    reboot\n
    halt\n
    poweroff\n
    lock\n
    "
else
    COMMANDS="
    suspend\n
    reboot\n
    halt\n
    poweroff\n
    lock\n
    "
fi

command=$(echo -e $COMMANDS | \
    dmenu -p "Power:" -fn "$FONT" -nb $BGCOL -nf $FGCOL -sb $SELBGCOL -sf $SELFGCOL)
[ "$command" = "" ] && exit 1
sudo $command && exit 0
