#!/bin/bash
WALLPAPER_FILLE=

echo "Введите полный путь к заставке: "
echo -n "➤ "
read -r WALLPAPER_PATH	

if [ -f "$WALLPAPER_PATH" ]; then
   
