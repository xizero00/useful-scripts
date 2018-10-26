#!/usr/bin/env bash
sudo add-apt-repository ppa:jonathonf/vim
sudo apt-get update
sudo apt install -y vim
proxychains git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

# vim ~/.vim_runtime/my_configs.vim
# set mouse=a
# set nu
