#!/bin/bash

# Script used by tmux to display the battery percentage in colored text
# Modified from https://github.com/rpellerin/dotfiles/blob/master/scripts/getBatteryState.sh

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

charging_icon="✔"
uncharging_icon="▼"

command_exists() {
  local command="$1"
  type "$command" >/dev/null 2>&1
}

print_battery_percentage() {
    if command_exists "upower"; then
        for battery in $(upower -e | grep battery); do
            state=$(upower -i $battery | grep state | awk '{print $2}')
            percentage=$(upower -i $battery | grep percentage | awk '{print $2}' | awk '{print substr($0, 1, length($0)-1)}')
        done
    elif command_exists "acpi"; then
        acpi -b | grep -Eo "[0-9]+%"
    else
        cat /proc/acpi/battery/BAT1/state | grep 'remaining capacity' | awk '{print $3}'
    fi

    if [ "$state" == 'charging' ] || [ "$state" == 'fully-charged' ]; then
        echo -n "$charging_icon "
    else
        echo -n "#[fg=colour82]$uncharging_icon #[fg=colour176]"
    fi
    echo -n "$percentage%"
}

main() {
  print_battery_percentage
}
main
