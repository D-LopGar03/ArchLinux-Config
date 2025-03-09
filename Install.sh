#!/bin/bash

# Description: Install all packages and dependencies needed for this configuration


configure(){
  if [ ! -d $HOME/.config ]; then
    mkdir -p "$HOME/.config/"

  fi

  cp -r * "$HOME/.config/" 
}

install_pacman_packages(){

  # UPDATE PACMAN
  sudo pacman -Syyu

  # PACMAN PACKAGES

  sudo pacman -S --needed git base-devel neovim nano rsync xclip virtualbox docker docker-compose openfortivpn swww nwg-look keepassxc obsidian rofi bpytop vivaldi swaylock brightnessctl waybar pavucontrol pipewire pipewire-pulse lftp python-pillow zsh

  # PACMAN PACKAGES UNINSTALL

  sudo pacman -R wofi vim

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
  yay -S --noconfirm python-pywal16 visual-studio-code-bin
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
