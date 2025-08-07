mic_vol=$(wpctl status | grep 'Digital Micr' | awk '{print $2}' | grep -o '[0-9]\+')
wpctl set-mute $mic_vol toggle
