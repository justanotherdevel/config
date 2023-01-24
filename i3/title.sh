#!/bin/bash
i3-msg -t subscribe -m '[ "window" ]'| jq --unbuffered -Mrc '. | select(.container.focused == true).container.window_properties.title'|
while IFS= read -r title; do
    # jq -n --arg title "$title" '[{"full_text": $title}]'
    OUTPUT=$(jq -n --arg title "$title" '$title' | cut -d'"' -f2)
    echo ${OUTPUT:0:$1}
done
