#!/bin/bash

read -n1 -p "goto: " ans

swaymsg [con_mark="$ans"] focus
