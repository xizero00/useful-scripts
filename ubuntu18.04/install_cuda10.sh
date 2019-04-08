#!/usr/bin/env bash

install_repos(){
    # GPU driver
    sudo add-apt-repository ppa:graphics-drivers/ppa

    # CUDA
    # From https://askubuntu.com/questions/1077061/how-do-i-install-nvidia-and-cuda-drivers-into-ubuntu/1077063#1077063
    sudo apt-key adv --fetch-keys  http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub
    sudo bash -c 'echo "deb http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64 /" > /etc/apt/sources.list.d/cuda.list'

    # CUDNN and NCCL
    wget https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64/nvidia-machine-learning-repo-ubuntu1804_1.0.0-1_amd64.deb
    sudo dpkg -i nvidia-machine-learning-repo-ubuntu1804_1.0.0-1_amd64.deb

    # Tensor RT
    wget http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64/nvinfer-runtime-trt-repo-ubuntu1804-5.0.2-ga-cuda10.0_1-1_amd64.deb
    sudo dpkg -i nvinfer-runtime-trt-repo-ubuntu1804-5.0.2-ga-cuda10.0_1-1_amd64.deb
}

install_packages(){
    # Install CUDA 10 and driver
    sudo apt update
    sudo apt install -y nvidia-driver-418
    sudo apt install -y cuda-10-0 libcudnn7 libcudnn7-dev
    sudo apt install -y libnccl2 libnccl-dev
    sudo apt install -y libnvinfer5 libnvinfer-dev
}

setup_env(){
    # set PATH for cuda 10.0 installation
    if [ -d "/usr/local/cuda-10.0/bin/" ]; then
        export PATH=/usr/local/cuda-10.0/bin${PATH:+:${PATH}}
        export LD_LIBRARY_PATH=/usr/local/cuda-10.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
    fi
}

install_repos
install_packages
setup_env