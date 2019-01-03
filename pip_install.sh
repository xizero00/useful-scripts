#!/usr/bin/env bash
sudo apt-get install python3-distutils
sudo apt-get install python-distutils

curl https://bootstrap.pypa.io/get-pip.py | sudo python3
curl https://bootstrap.pypa.io/get-pip.py | sudo python



# # install pip3 and update it
# sudo apt install -y python3-pip
# sudo -H pip3 install -U pip
# sudo apt remove -y python3-pip


# source ~/.bashrc

# # install pip2 and update it
# sudo apt install -y python-pip
# sudo -H pip install -U pip
# sudo apt remove -y python-pip

# set mirror repo
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
