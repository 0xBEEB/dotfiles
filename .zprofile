if [[ -z $DISPLAY && $TTY = /dev/tty1 ]]; then
    # export MOZ_ENABLE_WAYLAND=1
    export MOZ_ENABLE_XWAYLAND=1
    export XDG_SESSION_TYPE=wayland
    export XDG_CURRENT_DESKTOP=sway
    export QT_QPA_PLATFORMTHEME=qt5ct
    exec sway
fi
