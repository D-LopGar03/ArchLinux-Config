#!/bin/bash

# Lanza wayves.py y captura su salida
WAYVES_OUTPUT=$(python /home/ay4t0/.config/scripts/wayves/wayves.py -o cava -i cava -a cava)

# Estado de reproducción
if playerctl status 2>/dev/null | grep -q "Playing"; then
    CLASS="playing"
else
    CLASS=""
fi

# Waybar requiere JSON
echo "{\"text\": \"$WAYVES_OUTPUT\", \"class\": \"$CLASS\"}"

