#!/bin/bash

WINCOUNT=$(swaymsg -t get_tree | jq --unbuffered --compact-output '
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
] | length')

if [ $WINCOUNT == "0" ]; then
    #echo ""
    echo ""
elif [ $WINCOUNT == "1" ]; then
    echo ""
else
    echo ""
fi
