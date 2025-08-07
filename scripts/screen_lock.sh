#!/bin/zsh

wallpaper_dir="$HOME/.config/wallpapers/"

random_dir=$(find "$wallpaper_dir" -type d | shuf -n 1)

final_dir="$random_dir"

wallpaper=$(find "$final_dir" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \) | shuf -n 1)

swaylock --clock --indicator-idle-visible \
        --indicator-radius 100 \
        --indicator-thickness 7 \
        --ring-color 455a64 \
        --key-hl-color be5046 \
        --text-color ffc107 \
        --line-color 00000000 \
        --inside-color 00000088 \
        --separator-color 00000000 \
        --effect-scale 0.5 --effect-blur 7x3 --effect-scale 2 \
        --image $wallpaper        
