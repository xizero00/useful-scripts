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
    sudo apt-get install -y apt-transport-https
    sudo apt-get update
    sudo apt-get install -y code # or code-insiders
}

proxychains_install(){
    sudo apt install proxychains
    sudo mv /etc/proxychains.conf /etc/proxychains.conf.bak
    sudo cp ./proxychains.conf /etc/proxychains.conf
    
    

}

# ss
ss_install(){
    proxychains_install
    
    SERVER_IP=xxxxx
    SERVER_PORT=xxx
    LOCAL_PORT=1080
    PASSWORD=xxxx
    sudo apt install python-pip
    sudo pip install git+https://github.com/shadowsocks/shadowsocks.git@master
    sudo mv /etc/rc.local /etc/rc.local.bak
    sudo sh -c 'echo "#!/bin/sh -e\n sslocal -s $SERVER_IP -p $SERVER_PORT -l $LOCAL_PORT  -k $PASSWORD --fast-open -d start" > /etc/rc.local\n exit 0'
    sudo chmod +x /etc/rc.local
    sudo systemctl restart rc.local
    sudo systemctl status rc.local
}

bundle_install
vscode_install
ss_install
