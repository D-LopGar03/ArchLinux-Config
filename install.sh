#!/bin/bash

# Description: Install all packages and dependencies needed for this configuration

configure(){
  if [ ! -d $HOME/.config ]; then
    mkdir -p "$HOME/.config/"

  fi

  cp -r * "$HOME/.config/" 
}

copy_fonts(){
  sudo mkdir -p "/usr/share/fonts/HackNerdFonts"
  cd HackNerdFonts
  sudo wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/Hack.zip
  sudo unzip Hack.zip
  sudo rm -r Hack.zip
  sudo mv *.ttf "/usr/share/fonts/HackNerdFonts/"
}

install_pacman_packages(){

  # UPDATE PACMAN
  sudo pacman -Syuu

  # PACMAN PACKAGES

  sudo pacman -S --noconfirm --needed git base-devel neovim rsync xclip virtualbox-host-modules-arch docker docker-compose openfortivpn swww nwg-look keepassxc obsidian rofi bpytop vivaldi brightnessctl waybar pavucontrol pipewire pipewire-pulse lftp python-pillow zsh unzip zip ranger lsd bat timeshift qalculate-gtk tlp network-manager-applet

  # PACMAN PACKAGES UNINSTALL

  sudo pacman -R wofi vim nano 

}


init(){
  chmod +x "$HOME/.config/scripts/*" 
  swww img "$HOME/.config/wallpapers/retro-gaming/pacman-vintage-arcade-4k-wallpapers.jpg"
  wal -i "$HOME/.config/wallpapers/retro-gaming/pacman-vintage-arcade-4k-wallpapers.jpg" 
  waybar &
  hyprctl reload
  sudo systemctl enable --now iwd

}


chsh_func(){
  echo "Update your shell to /bin/zsh."
  chsh -s /bin/zsh $USER
}


install_yay() {
  # If not exists create the folder 
  mkdir -p "$HOME/Documents/Repositories"
  cd "$HOME/Documents/Repositories" || exit

  # Clone and compile yay-bin
  git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin || exit
  makepkg -si --noconfirm

  # Update system with yay
  yay -Syuu --noconfirm

  # Install additional packages with yay
  yay -S --noconfirm python-pywal16 visual-studio-code-bin swaylock-effectss
}

# If yay not exist in the system, install it
if ! command -v yay &>/dev/null; then
  install_yay
else
  echo "yay is already installed."
fi

install_pacman_packages
configure
chsh_func
copy_fonts
init

echo "System will reboot in 5 seconds"
sleep 5
reboot


