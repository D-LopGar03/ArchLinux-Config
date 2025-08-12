#!/usr/bin/env python3
import subprocess
import shutil
import os

CSS_NORMAL = "/home/ay4t0/.config/waybar/styles/style_no_music.css"
CSS_MUSICA = "/home/ay4t0/.config/waybar/styles/style_music.css"
CSS_DESTINO = "/home/ay4t0/.config/waybar/style.css"

# Iniciar la escucha del estado de playerctl
process = subprocess.Popen(["playerctl", "--follow", "status"], stdout=subprocess.PIPE, text=True)

# Inicializar el estado
ultimo_estado = None

for estado in process.stdout:
    estado = estado.strip()

    if estado == "Playing":
        if ultimo_estado != "musica":
            shutil.copy(CSS_MUSICA, CSS_DESTINO)
            os.system('pkill -SIGUSR2 waybar')
            ultimo_estado = "musica"

        # Obtener y notificar título y artista
        titulo = subprocess.run(["playerctl", "metadata", "title"], capture_output=True, text=True).stdout.strip()
        artista = subprocess.run(["playerctl", "metadata", "artist"], capture_output=True, text=True).stdout.strip()
        os.system(f'notify-send -h int:transient:1 "{titulo} - {artista}"')

    elif estado == "Paused" or estado == "Stopped":
        if ultimo_estado != "normal":
            shutil.copy(CSS_NORMAL, CSS_DESTINO)
            os.system('pkill -SIGUSR2 waybar')
            ultimo_estado = "normal"