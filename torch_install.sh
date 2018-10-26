#!/usr/bin/env bash


# install torch
torch_install(){
   proxychains git clone https://github.com/torch/distro.git ~/torch --recursive
   cd ~/torch; proxychains bash install-deps;
   proxychains bash install.sh
   cd ~/projects
}


# install cudnn.torch
cudnn_torch_install(){
   cd ~/projects
   proxychains git clone https://github.com/soumith/cudnn.torch -b R7
   cd cudnn.torch
   proxychains luarocks make
   cd ~/projects
}


# install hdf5
hdf5_torch_install(){
   sudo apt-get install -y libhdf5-serial-dev hdf5-tools
   proxychains luarocks install hdf5
}


# compile nccl and install it
nccl_compile_install(){
   cd ~/projects
   proxychains wget -O nccl-1.3.4-1.zip https://github.com/NVIDIA/nccl/archive/v1.3.4-1.zip
   unzip nccl-1.3.4-1.zip
   cd nccl-1.3.4-1
   make CUDA_HOME=/usr/local/cuda
   sudo make CUDA_HOME=/usr/local/cuda install
   cd ~/projects
}


# install nccl.torch
nccl_torch_install(){
    cd ~/projects
    proxychains git clone https://github.com/ngimel/nccl.torch.git
    cd nccl.torch
    proxychains luarocks make nccl-scm-1.rockspec
    cd ~/projects
}

mkdir ~/projects

#torch_install
#cudnn_torch_install
hdf5_torch_install

# torch7's nccl is dependent on the nccl-1.x.x not the nccl-2
# but nccl-1.x.x is dependent on CUDA8
#nccl_compile_install
#nccl_torch_install




