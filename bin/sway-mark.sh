#!/bin/bash

read -n1 -p "mark: " ans

swaymsg mark $ans
