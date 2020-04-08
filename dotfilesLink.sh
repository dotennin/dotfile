#! /bin/bash
ln -sf ~/dotfiles/.vimrc ~/.vimrc
#ln -sf ~/dotfiles/.gvimrc ~/.gvimrc
ln -sf ~/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dotfiles/.bash_profile ~/.bash_profile
ln -sf ~/dotfiles/.vim ~/.vim
ln -sf ~/dotfiles/.ideavimrc ~/.ideavimrc
ln -sf ~/dotfiles/.zshrc ~/.zshrc

ln -sf ~/dotfiles/bat ~/bat
ln -sf ~/dotfiles/bin ~/bin
ln -sf ~/dotfiles/.gitignore_global ~/.gitignore_global
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig

#git サブモジュール導入
apt-get -v &> /dev/null && OS="ubuntu" || OS="centos"
if [ $OS = "ubuntu"  ]
then
	sudo apt update
	sudo apt install -y git gcc

	# zsh installation
	sudo apt install -y zsh powerline fonts-powerline 
	# set default shell to zsh
	chsh -s /bin/zsh
	# install thefuck
	sudo apt install -y python3-dev python3-pip python3-setuptools
	sudo pip3 install thefuck
else
	sudo yum -y git gcc
fi
git pull && git submodule init && git submodule update && git submodule status

#カスタマイズライブラリの適用
cp -af ~/dotfiles/.vim/userautoload/config/* ~/dotfiles/.vim/bundle/ 
