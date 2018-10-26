#!/usr/bin/env bash

bundle_install(){
sudo apt install -y \
    htop \
    git \
    dstat \
    sshfs \
    mc \
    cmake \
    psensor\
    lm-sensors \
    unrar \
    uget \
    p7zip-full \
    ssh \
    silversearcher-ag
}

# vscode
vscode_install(){
    curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
    sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
    sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
    rm microsoft.gpg
    sudo apt-get install -y apt-transport-https
    sudo apt-get update
    sudo apt-get install -y code # or code-insiders
}

#bundle_install
vscode_install
