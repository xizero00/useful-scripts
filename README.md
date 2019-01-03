# Useful-scripts
Some useful scripts to install vim pip cuda tensorflow and pytorch nvidia-docker  
This repo can ONLY be used on **Ubuntu 16.04**

# 1.Configure and install basic softwares
Before installation, you have to configure it.  
### (0) Open the file **useful_software_install.sh**    
### (1) If you want to use shadowsocks to bypass the China's great wall.  
PLEASE SET THE VARIABLE in function **ss_install**
```bash
SERVER_IP=xxxxx
SERVER_PORT=xxx
LOCAL_PORT=1080
PASSWORD=xxxx
```
SERVER_IP is the shadowsocks server ip  
SERVER_PORT is the shadowsocks server port  
PASSWORD is the shadowsocks server password  
### (2) If you do not have a shadowsocks server, you can comment the **ss_install** to disable configure shadowsocks like this
```bash
bundle_install
aptfast_install
vscode_install
chrome_install
#ss_install
typora_install
```
Please feel free to comment them, if you don't want to install them  
### (3) Run the  file **useful_software_install.sh**  
```bash
bash useful_software_install.sh
```

# 2. Install other softwares

## Install CUDA
```bash
bash cuda_install.sh
```

## Install pip and set the pip repositoy to tsinghua's repo
```bash
bash pip_install.sh
```

## Install tensorflow and pytorch
```bash
bash tf_pytorch_install.sh
```

## Install common-used python package
```bash
bash tf_pytorch_install.sh
```

## Install tmux and configure it
```bash
bash tmux_install.sh
```

## Install torch
```bash
bash torch_install.sh
```

## Install the latest version vim
```bash
bash vim_install.sh
```

## Install nvidia-docker
```bash
bash nvidia_docker_install.sh
```

