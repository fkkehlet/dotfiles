#!/usr/bin/env bash

# RPM Fusion
sudo dnf install \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Flathub
sudo dnf install -y flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Neovim dependencies
sudo dnf install kitty bat neovim g++ npm ripgrep

# Command line utils
sudo dnf install htop
sudo dnf copr enable atim/lazygit
sudo dnf install lazygit
sudo dnf copr enable pennbauman/ports
sudo dnf install lf


# ENABLE X11 https://fedoraproject.org/wiki/KDE/X11_Unsupported
# System Settings → Colors & Themes → Login Screen (SDDM):
sudo dnf install plasma-workspace-x11


# dnf copr enable monkeybizness/kcm_webcam_settings
# dnf install kcm_webcam_settings



# Apps
flatpak install com.spotify.Client
flatpak install flathub com.obsproject.Studio

# Touchpad gestures with libinput-gestures
sudo gpasswd -a $USER input
sudo dnf install wmctrl xdotool
libinput-gestures-setup autostart start


# Docker
sudo dnf -y install dnf-plugins-core
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo systemctl start docker



# # Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
sudo dnf group install development-tools

# Helix
brew install helix
