#!/bin/bash

OPTION=$(echo -e "Lock\nLogout\nSuspend\nHibernate\nReboot\nShutdown" | wofi -d -p "What do you want to do?" &>/dev/null)

if [ "$OPTION" == "Lock" ]; then
    swaylock -f
elif [ "$OPTION" == "Logout" ]; then
    swaymsg exit
elif [ "$OPTION" == "Suspend" ]; then
    systemctl suspend
elif [ "$OPTION" == "Hibernate" ]; then
    systemctl hibernate
elif [ "$OPTION" == "Reboot" ]; then
    systemctl reboot
elif [ "$OPTION" == "Shutdown" ]; then
    systemctl poweroff
else
    echo "exiting"
fi
