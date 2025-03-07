curl https://get.docker.com | sh

sudo systemctl --now enable docker
distro=$(. /etc/os-release;echo $ID)
distro_version=$(. /etc/os-release;echo $VERSION_ID)
if [ $distro == 'fedora' ]; then
    sudo dnf install -y tar bzip2 make automake gcc gcc-c++ vim pciutils elfutils-libelf-devel libglvnd-devel iptables
    distribution='centos8'
    curl -s -L https://nvidia.github.io/libnvidia-container/$distribution/libnvidia-container.repo | sudo tee /etc/yum.repos.d/nvidia-container-toolkit.repo
    sudo dnf clean expire-cache --refresh
    sudo dnf install -y nvidia-container-toolkit
elif [ $distro == 'ubuntu' ]; then
    if [$distro_version == '22.10' || $distro_version == '23.04' ]; then
        distro_version='22.04'
    fi
    distribution=$(echo $distro$distro_version)
    curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
      && curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
        sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
        sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list
    sudo apt-get update
    sudo apt-get install -y nvidia-container-toolkit
fi
sudo nvidia-ctk runtime configure --runtime=docker
sudo systemctl restart docker
