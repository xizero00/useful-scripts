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
        curl \
        p7zip-full \
        ssh \
        silversearcher-ag \
        proxychains
}

# apt-fast
aptfast_install(){
    # reference : https://github.com/ilikenwf/apt-fast#package-manager
    sudo add-apt-repository ppa:apt-fast/stable
    sudo apt-get update
    sudo apt-get -y install apt-fast
}

# chrome
chrome_install(){
    # reference : https://github.com/FZUG/repo/wiki/%E5%AE%89%E8%A3%85-Chrome
    sudo cp repo/google-chrome.list /etc/apt/sources.list.d/google-chrome.list
    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv 1397BC53640DB551
    sudo apt-fast update
    sudo apt-fast install google-chrome-stable
}

# vscode
vscode_install(){
    # reference : https://code.visualstudio.com/docs/setup/linux
    curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
    sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
    sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
    sudo apt-fast install -y apt-transport-https
    sudo apt-fast update
    sudo apt-fast install -y code # or code-insiders
}

# proxychains
proxychains_install(){
    sudo apt-fast install proxychains
    sudo mv /etc/proxychains.conf /etc/proxychains.conf.bak
    sudo cp ./conf/proxychains.conf /etc/proxychains.conf
}

# ss
ss_install(){
    proxychains_install
    
    # reference : https://github.com/shadowsocks/shadowsocks/blob/master/README.md
    SERVER_IP=xxxxx
    SERVER_PORT=xxx
    LOCAL_PORT=1080
    PASSWORD=xxxx
    sudo apt-fast install python-pip
    sudo pip install git+https://github.com/shadowsocks/shadowsocks.git@master
    
    # back up rc.local to rc.local.bak
    sudo mv /etc/rc.local /etc/rc.local.bak
    
    # generate rc.local in conf directory
    echo "#!/bin/sh -e
sslocal -s $SERVER_IP -p $SERVER_PORT -l $LOCAL_PORT  -k $PASSWORD --fast-open -d start
exit 0" > ./conf/rc.local

    sudo chown root:root ./conf/rc.local
    sudo chmod +x ./conf/rc.local
    sudo mv ./conf/rc.local /etc/rc.local

    # wrong 
    # sudo sh -c 'echo "#!/bin/sh -e\n sslocal -s $SERVER_IP -p $SERVER_PORT -l $LOCAL_PORT  -k $PASSWORD --fast-open -d start" > /etc/rc.local\n exit 0'
    # sudo chmod +x /etc/rc.local
    
    sudo systemctl restart rc.local
    sudo systemctl status rc.local
}

typora_install(){
    # sudo apt-key adv --keyserver keyserver.ubuntu.com--recv-keys BA300B7755AFCFAE
    wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add -
    # add Typora's repository
    sudo add-apt-repository 'deb https://typora.io/linux ./'
    sudo apt-fast update
    # install typora
    sudo apt-fast install typora
}

bundle_install
aptfast_install
vscode_install
chrome_install
ss_install
typora_install
