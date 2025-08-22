WALLPAPER_DIR="/home/kmdavidds/Projects/nixos-config/modules/home-manager/swww"
DAY=$(date +%u)  # 1=Monday, 7=Sunday

case $DAY in
    1) WALLPAPER="$WALLPAPER_DIR/1.png" ;;
    2) WALLPAPER="$WALLPAPER_DIR/2.png" ;;
    3) WALLPAPER="$WALLPAPER_DIR/3.png" ;;
    4) WALLPAPER="$WALLPAPER_DIR/4.png" ;;
    5) WALLPAPER="$WALLPAPER_DIR/5.png" ;;
    6) WALLPAPER="$WALLPAPER_DIR/6.png" ;;
    7) WALLPAPER="$WALLPAPER_DIR/7.png" ;;
    *) WALLPAPER="$WALLPAPER_DIR/1.png" ;;
esac

[[ ! -f "$WALLPAPER" ]] && WALLPAPER="$WALLPAPER_DIR/1.png"

rm /home/kmdavidds/Projects/nixos-config/modules/home-manager/swww/current-wallpaper.png
cp $WALLPAPER /home/kmdavidds/Projects/nixos-config/modules/home-manager/swww/current-wallpaper.png
