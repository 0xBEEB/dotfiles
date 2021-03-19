#!/bin/bash

FILEPATH=$(pwd)

while [ -d "$FILEPATH" ]; do
    RESPONSE=$(echo -e "..\n`ls \"$FILEPATH\"`" | wofi -d)

    if [ "$RESPONSE" == ".." ]; then
        FILEPATH=$(dirname "$FILEPATH")
    elif [ -z "$RESPONSE" ]; then
        exit 1
    else
        FILEPATH="$FILEPATH/$RESPONSE"
    fi
    echo $FILEPATH
done

if [ -f "$FILEPATH" ]; then
    alacritty -e vim "$FILEPATH"
else
    exit 1
fi
