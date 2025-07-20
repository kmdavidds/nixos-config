# Loop over common image file types
for img in *.jpg *.jpeg *.png *.gif *.bmp *.webp; do
  [ -f "$img" ] || continue  # Skip if no matching file

  # Get width and height using ImageMagick
  read width height < <(identify -format "%w %h" "$img")

  # Calculate GCD to reduce the ratio
  gcd() {
    local a=$1 b=$2
    while [ $b -ne 0 ]; do
      local temp=$b
      b=$((a % b))
      a=$temp
    done
    echo $a
  }

  g=$(gcd "$width" "$height")
  arw=$((width / g))
  arh=$((height / g))

  # Print result
  echo "$img (${arw}:${arh}) (${width}px : ${height}px)"
done
