#!/bin/bash
# Doesn't seem to work well without an 'sleep' option

case $1 in
    standby|suspend|off)
        sleep 1s && xset dpms force $1
        ;;
    *)
        echo "Usage: $0 standby|suspend|off"
        ;;
  esac
