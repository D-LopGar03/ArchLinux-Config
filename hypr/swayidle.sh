#!/bin/bash

swayidle -w \
  timeout 300 '$HOME/.config/scripts/screen_lock.sh' \
  timeout 305 'hyprctl dispatch dpms off' \
  resume 'hyprctl dispatch dpms on' \
  before-sleep '$HOME/.config/scripts/screen_lock.sh'

