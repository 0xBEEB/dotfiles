#!/bin/bash


WINDOWS=$(swaymsg -t get_tree | jq -r --unbuffered --compact-output '
(
    select(.name == "root") |
    .nodes[] |
    select(.name == "__i3") |
    .nodes[] |
    select(.name == "__i3_scratch") |
    .focus
) as $scratch_ids |
[
    .. |
    (.nodes? + .floating_nodes?) // empty |
    .[] |
    select(.id|IN($scratch_ids[]))
        ] as $scratch_nodes |
            $scratch_nodes|map(.name)|join("\n")')

WINCOUNT=$(echo -e "$WINDOWS" | wc -l)

if [ $WINCOUNT -eq "1" ]; then
    swaymsg scratchpad show
elif [ $WINCOUNT -gt "1" ]; then
    RESP=$(echo -e "$WINDOWS" | wofi -d)
    echo $RESP
    swaymsg [title="^$RESP$"] focus
else
    echo "No scratchpad"
fi
