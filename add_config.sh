#!/bin/bash

# Adds a directory from the user's config to this repo

config_dir=$(dirname $1)
mkdir -p .config/$config_dir
mv ~/.config/$1 .config/$1
ln -s ~/Repos/kylediaz/dotfiles/.config/$1 ~/.config/$config_dir