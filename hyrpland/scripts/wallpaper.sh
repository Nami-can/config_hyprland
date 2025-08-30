#!/bin/bash


echo -e "\033[1;36m"
echo "┌──────────────────────────────────────────────┐"
echo "│                                              │"
echo "│   🌸  H Y P L U M A  -  Wallpaper Manager    │"
echo "│   ───────────────────────────────────────    │"
echo "│                                              │"
echo "│   🎨  Менеджер обоев в аниме-стиле          │"
echo "│   ✨  Для вашего Hyprland окружения          │"
echo "│                                              │"
echo "└──────────────────────────────────────────────┘"
echo -e "\033[0m"


echo "🖼️  Менеджер обоев Hyprland"
echo "────────────────────────────"

# Меню выбора
echo "1. 🎨 Выбрать новые обои"
echo "2. 🔄 Восстановить последние обои" 
echo "3. ❌ Выйти"
echo ""
echo -n "Выберите вариант [1-3]: "

read -r choice

case $choice in
    1)
        echo ""
        echo "🖼️  Запуск выбора обоев..."
        ~/.config/hypr/scripts/wallpaper-changer.sh
        ;;
    2)
        echo ""
        echo "🔁 Восстанавливаем последние обои..."
        ~/.config/hypr/scripts/load-wallpaper.sh
        ;;
    3)
        echo ""
        echo "👋 До свидания!"
        exit 0
        ;;
    *)
        echo ""
        echo "❌ Неверный выбор! Попробуйте снова."
        exit 1
        ;;
esac

echo ""
echo "✅ Готово! Обои успешно изменены."
