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
        silversearcher-ag \
        proxychains
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

# ss
ss_install(){
    SERVER_IP=1.1.1.1
    SERVER_PORT=1111
    LOCAL_PORT=1080
    PASSWORD=xxxx

    sudo pip install git+https://github.com/shadowsocks/shadowsocks.git@master
    sudo mv /etc/rc.local /etc/rc.local.bak
    sudo sh -c 'echo "sslocal -s $SERVER_IP -p $SERVER_PORT -l $LOCAL_PORT  -k $PASSWORD --fast-open -d start" > /etc/rc.local'
    sudo systemctl restart rc.local
}

bundle_install
vscode_install
ss_install
