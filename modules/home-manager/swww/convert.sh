for img in *.jpg; do
  [ -f "$img" ] || continue
  convert "$img" "${img%.jpg}.png"
done
