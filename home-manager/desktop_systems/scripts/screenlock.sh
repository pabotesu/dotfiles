swayidle -w \
timeout 60 'swaylock -f' \
timeout 120 'hyprctl dispatch dpms off' \
resume \\'hyprctl dispatch dpms on' &