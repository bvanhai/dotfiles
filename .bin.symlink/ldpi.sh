#!/usr/bin/bash
# Ref: https://www.reddit.com/r/archlinux/comments/5x2syg/multiple_monitors_with_different_dpis/
# Use this script to run a program in low DPI setting (for fullHD monitor 1920x1080)

xrdb -merge ~/.Xresources
OLDDPI=$(xrdb -query | awk '/Xft.dpi/ {print $2}')
echo "Old dpi=$OLDDPI"
xrdb -merge <(echo "Xft.dpi: 92")
echo "New dpi=$(xrdb -query | awk '/Xft.dpi/ {print $2}')"

# $@ &
$* &

# sleep is needed here, otherwise program will launch using the old dpi
# setting instead of new dpi
sleep 1

echo "Restoring to old dpi=$OLDDPI"
xrdb -merge <(echo "Xft.dpi: $OLDDPI")

# To calculate monitor DPI:
# First, run `xrandr` to get the dimension of the monitor, below is the output
#
# For the Thinkpad T460 HD monitor:
# eDP1 connected primary 1920x1080+0+0 (normal left inverted right x axis y axis) 310mm x 170mm
# Calculate DPI:
# 1920/(31.0/2.54) = 157.3 dpi
# 1080/(17.0/2.54) = 161.4 dpi
