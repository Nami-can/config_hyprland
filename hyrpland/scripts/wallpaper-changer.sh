#!/bin/bash

# Переменная которая будет хранить путь к файлу
WALLPAPER_FILLE=~/.config/hypr/wallpaper.conf

echo "Введите полный путь к обоим: "
echo -n	"➤ "
read -r WALLPAPER_PATH

if [ -f "$WALLPAPER_PATH" ]; then
   pkill -f swaybg
   swaybg -i "$WALLPAPER_PATH" -m fill &
   echo  "$WALLPAPER_PATH" > "$WALLPAPER_FILLE"
   echo "Обои успешно установлены"
   echo "Путь: $WALLPAPER_PATH"
else
   echo "Ошибка: Файл не существует!"
   echo "Проверьте путь: $WALLPAPER_PATH"

fi
