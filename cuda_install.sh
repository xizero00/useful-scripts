#!/usr/bin/env bash

# Repo: http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/
# Add NVIDIA package repository
sudo apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_9.0.176-1_amd64.deb
sudo apt install -y ./cuda-repo-ubuntu1604_9.0.176-1_amd64.deb
wget http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64/nvidia-machine-learning-repo-ubuntu1604_1.0.0-1_amd64.deb
sudo apt install -y ./nvidia-machine-learning-repo-ubuntu1604_1.0.0-1_amd64.deb
sudo apt update

# Install CUDA and tools. Include optional NCCL 2.x
sudo apt install -y cuda9.0 cuda-cublas-9-0 cuda-cufft-9-0 cuda-curand-9-0 \
	    cuda-cusolver-9-0 cuda-cusparse-9-0 libcudnn7=7.2.1.38-1+cuda9.0 \
	        libnccl2=2.2.13-1+cuda9.0 cuda-command-line-tools-9-0

sudo apt install -y cuda-9-0


# hold the version
sudo apt-mark hold cuda-9-0
sudo apt-mark hold libcudnn7
sudo apt-mark hold libnccl2
