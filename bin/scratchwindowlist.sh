#!/bin/bash

swaymsg -t get_tree |
	jq -r 'recurse(.nodes[]?) | select(.name == "__i3_scratch").floating_nodes[].app_id, select(.name == "__i3_scratch").floating_nodes[].window_properties.title' |
	grep -v null |
	wofi --show=dmenu --lines=5 --prompt=""
