# /bin/zsh

ARTIST=$(playerctl metadata xesam:artist 2>/dev/null)
TITLE=$(playerctl metadata xesam:title 2>/dev/null)

# Concatenar "Artista - Título"
TOOLTIP="$ARTIST - $TITLE"

# Salida en formato JSON para Waybar
echo "{\"text\": \"$WAYVES_OUTPUT\", \"tooltip\": \"🎵 $TOOLTIP\"}"
