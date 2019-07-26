#!/bin/sh

cd $(dirname $0)/..

mkdir -p backup
tar zcf backup/backup_config.tar.gz ~/.bashrc ~/.gitconfig ~/.zshrc

git clone https://github.com/robbyrussell/oh-my-zsh.git ./zsh/oh-my-zsh
git clone https://github.com/bhilburn/powerlevel9k.git ./zsh/oh-my-zsh/custom/themes/powerlevel9k
ln -s $(pwd)/bash/bashrc ~/.bashrc
ln -s $(pwd)/git/gitconfig ~/.gitconfig
ln -s $(pwd)/zsh/zshrc ~/.zshrc

