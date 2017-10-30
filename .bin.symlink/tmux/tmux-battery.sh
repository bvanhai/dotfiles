#!/bin/sh
# Script used by tmux to display the battery state
# Make sure 'acpi' is installed

command_exists() {
    local command="$1"
    type "$command" >/dev/null 2>&1
}

print_battery_state() {
    if command_exists "acpi"; then
        state=$(acpi -b | awk '{gsub(",",""); print $3}')

        if [ "$state" == 'Charging' ] || [ "$state" == 'Full' ] || [ "$state" == 'Unknown' ]; then
            echo -n ""
        elif [ "$state" == 'Discharging' ]; then
            echo -n "#[fg=colour83]▼ "
            acpi -b | awk '{gsub(",",""); print $4}'
        fi
    fi
}

print_battery_state
