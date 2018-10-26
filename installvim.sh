#!/usr/bin/env bash
sudo add-apt-repository ppa:jonathonf/vim
sudo apt-get update
sudo apt install -y vim
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
