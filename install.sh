#!/bin/bash

printf "input sudo password: "
read password

# install essentials
# TODO; Ubuntu の場合のみ
#echo ${password} | sudo -S apt -y install jq tig openssl build-essential fonts-not fonts-ricty-dimeinished fonts-roboto python-fontforge


# setup fonts
mkdir -p .fonts

####  setup nvim  ####

mkdir -p ~/.config/nvim

# install vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Enter Neovim and install plugins using a temporary init.vim, which avoids warnings about missing colorschemes, functions, etc
sed '/call plug#end/q' init.vim > ~/.config/nvim/init.vim
nvim -c ':PlugInstall' -c ':UpdateRemotePlugins' -c ':qall'
rm ~/.config/nvim/init.vim

cp init.vim ~/.config/nvim/init.vim
