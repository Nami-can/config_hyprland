#!/bin/bash

case $1 in
    up)
        pactl set-sink-volume @DEFAULT_SINK@ +5%
        ;;
    down)
        pactl set-sink-volume @DEFAULT_SINK@ -5%
        ;;
    mute)
        pactl set-sink-mute @DEFAULT_SINK@ toggle
        ;;
esac

VOLUME=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -1)
VOL_NUM=${VOLUME%\%}
MUTED=$(pactl get-sink-mute @DEFAULT_SINK@ | grep -oP 'yes|no')

if [ "$MUTED" = "yes" ]; then
    ICON="󰖁"
    TITLE="Sound Muted"
    
    # Уведомление с правильным синтаксисом
    notify-send -t 1000 \
        -h "string:x-canonical-private-synchronous:volume" \
        -h "int:value:0" \
        "$ICON  $TITLE" \
        "──────────"

else
    # Иконка по уровню громкости
    if [ $VOL_NUM -eq 0 ]; then
        ICON="󰕿"
    elif [ $VOL_NUM -lt 33 ]; then
        ICON="󰖀"
    elif [ $VOL_NUM -lt 66 ]; then
        ICON="󰕾"
    else
        ICON="󰕾"
    fi

    # Progress bar
    FILLED_COUNT=$((VOL_NUM / 10))
    EMPTY_COUNT=$((10 - FILLED_COUNT))
    
    PROGRESS_BAR=""
    for ((i=0; i<FILLED_COUNT; i++)); do
        PROGRESS_BAR+="█"
    done
    for ((i=0; i<EMPTY_COUNT; i++)); do
        PROGRESS_BAR+="░"
    done

    # Простое уведомление без сложных hint'ов
    notify-send -t 1000 \
        -h "string:x-canonical-private-synchronous:volume" \
        "$ICON  Volume: $VOLUME" \
        "$PROGRESS_BAR"
fi

# Вывод для waybar
echo "$ICON $VOLUME"

