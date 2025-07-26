#!/usr/bin/env bash

echo "[ ] Downloading neovim (stable)"
wget -q --show-progress https://github.com/neovim/neovim/releases/download/stable/nvim-linux-x86_64.appimage -O /tmp/nvim

echo "[ ] Installing neovim"
chmod +x /tmp/nvim
sudo mv /tmp/nvim /usr/local/bin/nvim

echo "[ ] Setting alternatives"
sudo update-alternatives --install /usr/bin/editor editor /usr/local/bin/nvim 1 && \
sudo update-alternatives --set editor /usr/local/bin/nvim
# Now calling: update-alternatives --config editor, will show local nvim

sudo update-alternatives --install /usr/bin/vim vim /usr/local/bin/nvim 1 && \
sudo update-alternatives --set vim /usr/local/bin/nvim
# Now calling: update-alternatives --config nvim, will show local nvim

# update-alternatives --list vim
# update-alternatives --remove vim /usr/local/bin/nvim

echo "[ ] Check: .config/nvim/install.sh"
