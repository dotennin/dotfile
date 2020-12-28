#! /bin/bash
if [ "$(uname)" == 'Darwin' ]; then
  OS='Mac'
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
  apt-get -v &> /dev/null && OS="ubuntu" || OS="centos"
elif [ "$(expr substr $(uname -s) 1 10)" == 'MINGW32_NT' ]; then                                                                                           
  OS='Cygwin'
else
  echo "Your platform ($(uname -a)) is not supported."
  exit 1
fi
if [ $OS = "ubuntu"  ]
then
	sudo apt update
	sudo apt install -y git gcc

	# zsh installation
	sudo apt install -y zsh curl powerline fonts-powerline 

	# install oh-my-zsh
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

	# set default shell to zsh
	chsh -s /bin/zsh

	# install thefuck
	sudo apt install -y python3-dev python3-pip python3-setuptools
	sudo pip3 install thefuck
elif [ $OS = "Mac" ]; then
	brew install gcc cask
	brew cask install iterm2
	brew install zsh

	# set default shell to zsh
	chsh -s /bin/zsh
	exec $SHELL -l
	# install oh-my-zsh
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

	brew install thefuck
	
else
	sudo yum -y git gcc
fi

# import git module
git pull && git submodule init && git submodule update && git submodule status

# move custom library
cp -af ~/dotfiles/.vim/userautoload/config/* ~/dotfiles/.vim/bundle/ 

ln -sf ~/dotfiles/.vimrc ~/.vimrc
#ln -sf ~/dotfiles/.gvimrc ~/.gvimrc
ln -sf ~/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dotfiles/.bash_profile ~/.bash_profile
ln -sf ~/dotfiles/.bash_aliases ~/.bash_aliases
ln -sf ~/dotfiles/.vim ~/.vim
ln -sf ~/dotfiles/.ideavimrc ~/.ideavimrc
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.wslconfig ~/.wslconfig

ln -sf ~/dotfiles/bat ~/bat
ln -sf ~/dotfiles/bin ~/bin
ln -sf ~/dotfiles/.gitignore_global ~/.gitignore_global
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
