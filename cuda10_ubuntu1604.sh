#!/usr/bin/env bash

PROXY=proxychains

if [[ ! -d "~/softwares/cuda_10" ]]; then
    mkdir -p ~/softwares/cuda_10
fi

pushd ~/softwares/cuda_10

# Download and install repo
${PROXY} wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_10.0.130-1_amd64.deb
${PROXY} wget https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64/nvidia-machine-learning-repo-ubuntu1604_1.0.0-1_amd64.deb
${PROXY} wget https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64/nvinfer-runtime-trt-repo-ubuntu1604-5.0.2-ga-cuda10.0_1-1_amd64.deb

sudo dpkg -i cuda-repo-ubuntu1604_10.0.130-1_amd64.deb 
sudo dpkg -i nvidia-machine-learning-repo-ubuntu1604_1.0.0-1_amd64.deb
sudo dpkg -i nvinfer-runtime-trt-repo-ubuntu1604-5.0.2-ga-cuda10.0_1-1_amd64.deb

popd ~/softwares/cuda_10

sudo ${PROXY} apt update


# Install cuda and libcudnn and libnccl2
sudo ${PROXY} apt install cuda-10-0 libcudnn7 libcudnn7-dev libnccl2
