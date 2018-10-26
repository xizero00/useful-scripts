#!/usr/bin/env bash

sudo apt install -y python3-pip python-pip

sudo -H pip3 install --upgrade pip
sudo -H pip install --upgrade pip

sudo apt remove -y python3-pip python-pip

pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
pip3 config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
