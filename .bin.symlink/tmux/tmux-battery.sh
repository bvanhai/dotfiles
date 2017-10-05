#!/bin/bash

# Script used by tmux to display the battery state

command_exists() {
  local command="$1"
  type "$command" >/dev/null 2>&1
}

print_battery_state() {
    if command_exists "upower"; then
        for battery in $(upower -e | grep battery); do
            state=$(upower -i $battery | grep state | awk '{print $2}')
        done
    fi

    if [ "$state" == 'charging' ] || [ "$state" == 'fully-charged' ]; then
        echo -n ""
    else
        echo -n " #[fg=colour82]▼"
    fi
}

print_battery_state
