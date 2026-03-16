#!/usr/bin/env bash
set -euo pipefail


# ── HOST (Bazzite) ────────────────────────────────────────────────────────────
# Install core tools system-wide (requires reboot to apply) - MANUAL INSTALL
# sudo rpm-ostree install keyd kitty neovim powertop zsh
# echo "↪️  Host packages queued. Reboot after this script to apply."
# Set keyboard layout to us-intl, then meta+z, meta+x, meta+Z, meta+X for
# moving between virtual desktops and moving screens between them
#
# Install nvm:
# wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
#
# Install all-ways-egpu:
# cd ~; curl -qLs  https://github.com/ewagner12/all-ways-egpu/releases/latest/download/all-ways-egpu.zip  -o all-ways-egpu.zip; unzip all-ways-egpu.zip; cd all-ways-egpu-main; chmod +x install.sh; sudo ./install.sh; cd ../; rm -rf all-ways-egpu.zip all-ways-egpu-main

# Change default shell to zsh
chsh -s /bin/zsh

git config --global user.email "fkehlet@protonmail.com"
git config --global user.name "fkkehlet"


# Nice CLIs via Homebrew (no reboot)
brew install bat lazygit lf nvm npm postgresql@16

brew services start postgresql@16

# ── DOTFILES & SYMLINKS ───────────────────────────────────────────────────────
DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

mkdir -p "$HOME/.config" "$HOME/.local/bin"

rm -rf "$HOME/.config/kitty"     && ln -s "$DOTFILES/kitty"           "$HOME/.config/kitty"
rm -f  "$HOME/.zshrc"            && ln -s "$DOTFILES/zsh/zshrc"       "$HOME/.zshrc"
rm -rf "$HOME/.config/lf"        && ln -s "$DOTFILES/lf"              "$HOME/.config/lf" || true
rm -f  "$HOME/.tmux.conf"        && ln -s "$DOTFILES/tmux/tmux.conf"  "$HOME/.tmux.conf"
rm -rf "$HOME/.config/nvim"      && ln -s "$DOTFILES/nvim"            "$HOME/.config/nvim"

rm -f  "$HOME/.local/bin/t"      && ln -s "$DOTFILES/scripts/t"       "$HOME/.local/bin/t"
chmod +x "$HOME/.local/bin/t"

echo "✅ Done"

# #!/usr/bin/env bash
#
# # Neovim dependencies
# # sudo dnf install kitty bat neovim g++ npm ripgrep
#
# sudo rpm-ostree install keyd kitty neovim zsh
#
# # Clipboard functionality
# # sudo dnf install xclip
#
# # Command line utils
# brew install bat lazygit lf
#
#
# # =======
# # FLATPAK
# # =======
# # Spotify
# # OBS
#
# # =========
# # DISTROBOX
# # =========
#
# # Create a Fedora dev container
# distrobox create -i fedora:latest -n dev
# distrobox enter dev
#
# # Inside container, install development tools
# sudo dnf group install development-tools
# sudo dnf install gcc-c++ npm
# sudo dnf install postgresql postgresql-server postgresql-contrib
# sudo postgresql-setup --initdb --unit postgresql
# sudo systemctl enable postgresql
# sudo systemctl start postgresql
#
# exit
#
# # ========
# # DOTFILES
# # ========
#
# DOTFILES=$(cd $(dirname "${BASH_COURSE[0]}") && pwd)
#
# # ========
# # SYMLINKS
# # ========
#
# rm -rf $HOME/.config/kitty
# ln -s $DOTFILES/kitty $HOME/.config/kitty
#
# rm -rf $HOME/.zshrc
# ln -s $DOTFILES/zsh/zshrc $HOME/.zshrc
#
# rm -rf $HOME/.config/lf
# ln -s $DOTFILES/lf $HOME/.config/lf
#
# rm -rf $HOME/.tmux.conf
# ln -s $DOTFILES/tmux/tmux.conf $HOME/.tmux.conf
#
# rm -rf $HOME/.config/nvim
# ln -s $DOTFILES/nvim $HOME/.config/nvim
#
# # ==============
# # HELPER SCRIPTS
# # ==============
#
# mkdir -p $HOME/.local/bin
#
# rm -rf $HOME/.local/bin/t
# ln -s $DOTFILES/scripts/t $HOME/.local/bin/t
# chmod +x ~/.local/bin/t
