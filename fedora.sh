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
sudo dnf install kitty
sudo dnf install bat
sudo dnf install neovim
sudo dnf install g++
sudo dnf install npm
sudo dnf install ripgrep

# General utilities
sudo dnf install htop
sudo dnf copr enable atim/lazygit
sudo dnf install lazygit
sudo dnf copr enable pennbauman/ports
sudo dnf install lf
