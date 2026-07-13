#!/bin/bash


sudo apt install curl vim -y

# 复制脚本文件
cp -r ./scripts ~/

# 复制 git 配置文件
cp ./git/.gitconfig ~/

# 复制 vim 配置目录
cp -r ./vim/.vim ~/

# 复制 vim 配置文件
cp ./vim/.vimrc ~/

# 安装 vim-plug 插件管理器
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# 不启动交互式 vim，直接执行 :PlugInstall 安装插件
vim +PlugInstall +qall
