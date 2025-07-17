WALLPAPER_DIR="/home/kmdavidds/Projects/nixos-config/modules/home-manager/swww"
DAY=$(date +%u)  # 1=Monday, 7=Sunday

case $DAY in
    1) WALLPAPER="$WALLPAPER_DIR/sakura-trees.jpg" ;;
    2) WALLPAPER="$WALLPAPER_DIR/pink-clouds.jpg" ;;
    3) WALLPAPER="$WALLPAPER_DIR/flower-field.jpg" ;;
    4) WALLPAPER="$WALLPAPER_DIR/waves.png" ;;
    5) WALLPAPER="$WALLPAPER_DIR/blossoms.png" ;;
    6) WALLPAPER="$WALLPAPER_DIR/evening-sky.png" ;;
    7) WALLPAPER="$WALLPAPER_DIR/shaded-landscape.png" ;;
    *) WALLPAPER="$WALLPAPER_DIR/evening-sky.png" ;;
esac

[[ ! -f "$WALLPAPER" ]] && WALLPAPER="$WALLPAPER_DIR/evening-sky.png"

rm /home/kmdavidds/Projects/nixos-config/modules/home-manager/swww/current-wallpaper.png
cp $WALLPAPER /home/kmdavidds/Projects/nixos-config/modules/home-manager/swww/current-wallpaper.png
