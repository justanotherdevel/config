#!/bin/bash

# List all Wacom devices, get their IDs using 'id:', and configure them
xsetwacom --list devices | grep 'Wacom' | while read -r line; do
    device_id=$(echo "$line" | awk -F 'id: ' '{split($2, a, " "); print a[1]}')  # Extracting the ID right after 'id:'
    xsetwacom --set $device_id MapToOutput DisplayPort-0
done

