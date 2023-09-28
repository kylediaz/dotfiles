#!/bin/bash

if [ $1 == '--dotfiles' ]; then

  # Link config files to user's config dir
  git clone https://github.com/kylediaz/dotfiles.git
  source=$(pwd)/dotfiles/.config
  target=~/.config
  mkdir -p $target
  for folder in $source/*; do
    if [ -d "$folder" ]; then
      ln -s "$folder" "$target/$(basename "$folder")"
    fi
  done

  # Install packages
  sudo dnf install i3-gaps neovim rofi alacritty rofi ranger neofetch 

  # Install VSCode
  sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
  sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
  dnf check-update
  sudo dnf install code
elif [ $1 == '--docker']; then
  curl https://get.docker.com | sh
  sudo systemctl --now enable docker
  distro=$(. /etc/os-release;echo $ID)
  distro_version=$(. /etc/os-release;echo $VERSION_ID)
  if [ $ID == 'fedora' ]; then
    sudo dnf install -y tar bzip2 make automake gcc gcc-c++ vim pciutils elfutils-libelf-devel libglvnd-devel iptables
    distribution='centos8'
    curl -s -L https://nvidia.github.io/libnvidia-container/$distribution/libnvidia-container.repo | sudo tee /etc/yum.repos.d/nvidia-container-toolkit.repo
    sudo dnf clean expire-cache --refresh
    sudo dnf install -y nvidia-container-toolkit
  elif [ $id == 'ubuntu' ]; then
    if [$distro_version == '22.10' || $distro_version == '23.04' ]; then
      distro_version='22.04'
    fi
    distribution=$(echo $distro$distro_version)
    curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg
    curl -s -L https://nvidia.github.io/libnvidia-container/experimental/$distribution/libnvidia-container.list | \
        sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
        sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list
    sudo apt-get update
    sudo apt-get install -y nvidia-container-toolkit
  fi
  sudo nvidia-ctk runtime configure --runtime=docker
  sudo systemctl restart docker
else
 echo 'Usage: ./install.sh [--dotfiles|--docker]'
fi
