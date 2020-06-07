#!/bin/bash

printf "input sudo password: "
read password

# install essentials
# TODO; Ubuntu の場合のみ
#echo ${password} | sudo -S apt -y install jq tig openssl build-essential fonts-not fonts-ricty-dimeinished fonts-roboto python-fontforge

get_os() {
  if [ "$(uname)" == 'Darwin' ]; then
    OS='Mac'
  elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
    if [ -e /etc/debian_version ] || [ -e /etc/debian_release ]; then
      # Check Ubuntu or Debian
      if [ -e /etc/lsb-release ]; then
        # Ubuntu
        OS='ubuntu'
      else
        # Debian
        OS='debian'
      fi
    elif [ -e /etc/fedora-release ]; then
      # Fedra
      OS='fedora'
    elif [ -e /etc/redhat-release ]; then
      if [ -e /etc/oracle-release ]; then
        # Oracle Linux
        OS='oracle'
      else
        # Red Hat Enterprise Linux
        OS='redhat'
      fi
    else
      OS='Linux'
    fi
  elif [ "$(expr substr $(uname -s) 1 10)" == 'MINGW32_NT' ]; then                                                                                           
    OS='Cygwin'
  else
    echo "Your platform ($(uname -a)) is not supported."
    exit 1
  fi

  echo "$OS"
}

if [ "$(get_os)" == 'ubuntu' ]; then
  echo "$password" | sudo -s apt install \
    autoconf \
    automake \
    cheese \
    cinnamon \
    curl \
    fcitx \
    fcitx-mozc \
    libtool \
    meson \
    plank \
    silversearcher-ag \
    variety \
    variety-slideshow
fi

# setup fonts
mkdir -p .fonts

####  setup bash  ####


####  setup zsh  ####

# install vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

####  setup nvim  ####

mkdir -p ~/.config/nvim

# Enter Neovim and install plugins using a temporary init.vim, which avoids warnings about missing colorschemes, functions, etc
sed '/call plug#end/q' init.vim > ~/.config/nvim/init.vim
nvim -c ':PlugInstall' -c ':UpdateRemotePlugins' -c ':qall'
rm ~/.config/nvim/init.vim

cp init.vim ~/.config/nvim/init.vim
