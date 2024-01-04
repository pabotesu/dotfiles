swayidle -w \
timeout 600 'swaylock -f' \
timeout 1200 'hyprctl dispatch dpms off' \
resume 'hyprctl dispatch dpms on' &