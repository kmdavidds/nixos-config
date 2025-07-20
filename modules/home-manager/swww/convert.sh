for img in *.png; do
  [ -f "$img" ] || continue
  convert "$img" "${img%.jpg}.png"
done
