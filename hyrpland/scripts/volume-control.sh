#!/bin/bash
# ~/.config/hypr/scripts/volume-control.sh

case $1 in
    up)
        pamixer -i 5
        ;;
    down)
        pamixer -d 5
        ;;
    mute)
        pamixer -t
        ;;
esac

VOLUME=$(pamixer --get-volume)
MUTED=$(pamixer --get-mute)

if [ "$MUTED" = "true" ]; then
    dunstify -h string:x-dunst-stack-tag:volume "🔇 Muted" -t 1000
else
    dunstify -h string:x-dunst-stack-tag:volume "🔊 Volume: $VOLUME%" -t 1000
fi
