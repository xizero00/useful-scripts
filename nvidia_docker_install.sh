#/usr/bin/env bash

#一、首先安装docker-ce
function install_docker_ce(){
    #(1)如果你过去安装过 docker，先删掉:
    sudo apt-get remove docker docker-engine docker.io

    #(2)首先安装依赖:
    sudo apt-get install apt-transport-https ca-certificates curl gnupg2 software-properties-common

    #(3)根据你的发行版，下面的内容有所不同。你使用的发行版： 
    #信任 Docker 的 GPG 公钥:
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

    #(4)对于 amd64 架构的计算机，添加软件仓库:
    sudo add-apt-repository \
    "deb [arch=amd64] https://mirrors.tuna.tsinghua.edu.cn/docker-ce/linux/ubuntu \
    $(lsb_release -cs) \
    stable"

    #(5)最后安装
    sudo apt-get update
    sudo apt-get install docker-ce
}


#二、安装nvidia-docker
function install_nvidia_docker(){
    #参考：https://github.com/NVIDIA/nvidia-docker
    #(1)# If you have nvidia-docker 1.0 installed: we need to remove it and all existing GPU containers
    docker volume ls -q -f driver=nvidia-docker | xargs -r -I{} -n1 docker ps -q -a -f volume={} | xargs -r docker rm -f
    sudo apt-get purge -y nvidia-docker

    #(2)# Add the package repositories
    curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | \
    sudo apt-key add -
    distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
    curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | \
    sudo tee /etc/apt/sources.list.d/nvidia-docker.list
    sudo apt-get update

    #(3)# Install nvidia-docker2 and reload the Docker daemon configuration
    sudo apt-get install -y nvidia-docker2
    sudo pkill -SIGHUP dockerd

    #(4)# Test nvidia-smi with the latest official CUDA image
    docker run --runtime=nvidia --rm nvidia/cuda:9.0-base nvidia-smi
}

# 可能不奏效，因为安装了nvidia-docker
#三、设置docker下载镜像的地址为国内的docker的镜像地址（即设置registry）
function set_docker_china_registry(){
    #参考：https://www.docker-cn.com/registry-mirror
    #(1)为了永久性保留更改，您可以修改 /etc/docker/daemon.json 文件并添加上 registry-mirrors 键值。
    sudo cp conf/docker/daemon.json /etc/docker/

    #(2)修改保存后重启 Docker 以使配置生效
    sudo systemctl restart docker
}


install_docker_ce
install_nvidia_docker
#set_docker_china_registry
