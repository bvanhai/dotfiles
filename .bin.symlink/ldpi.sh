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
# for the Acer HD monitor:
# HDMI-0 connected 1920x1080+3840+0 (normal left inverted right x axis y axis) 531mm x 299mm
# Calculate DPI:
# 1920/(53.1/2.54) = 1080/(29.9/2.54) = 91.8 dpi
#
# For Samsung 4k monitor
# DP-0 connected primary 3840x2160+0+0 (normal left inverted right x axis y axis) 520mm x 290mm
# 3840/(52.0/2.54) = 187.6 dpi
# 2160/(29.0/2.54) = 189 dpi
#
# for Thinkpad T460 HD monitor:
# 1920x1080 with 339mm x 232.5mm
# Calculate DPI:
# 1920/(33.9/2.54) =143.9 dpi
# 1080/(23.25/2.54) = 118 dpi
