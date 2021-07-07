#!/bin/bash

WORKINGDIR="$HOME/.config/rofi/"
MAP="$XDG_DATA_HOME/rofi/scripts/power/cmd.csv"

cat "$MAP" \
    | cut -d ',' -f 1 \
    | rofi -dmenu -i -p "Power Control " \
    | head -n 1 \
    | xargs -i --no-run-if-empty grep "{}" "$MAP" \
    | cut -d ',' -f 2 \
    | head -n 1 \
    | xargs -i --no-run-if-empty /bin/bash -c "{}"

exit 0

