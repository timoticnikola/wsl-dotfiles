#!/bin/bash

sudo apt update && sudo apt upgrade -y
sudo apt install vim zsh curl wget x11-apps socat -y

mkdir /tmp/.X11-unix
socat -b65536 UNIX-LISTEN:/tmp/.X11-unix/X0,fork,mode=777 VSOCK-CONNECT:2:6000 &
export DISPLAY=:0.0

chsh -s $(which zsh)

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions


cp ~/.zshrc ~/.zshrc.bk
cp .zshrc ~/.zshrc

zsh

source ~/.zshrc

