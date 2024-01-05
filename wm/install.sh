#!/bin/bash
set -e
current_dir="$(pwd)"
config_dir=$HOME/.config

# Create symlinks to this folder :)
echo 'installing t4bby/dotfiles'
echo 'creating symlinks'

# install rofi,picom,i3,alacritty configs
declare -a dotfiles=("rofi" "picom" "i3" "alacritty")
for i in "${dotfiles[@]}"
do
   rm -rf $config_dir/$i
   ln -sf $current_dir/$i $config_dir
done

echo 'installation completed!'