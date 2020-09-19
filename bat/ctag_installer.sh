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

if [ $OS = "ubuntu" ]
then
	# ctags がインストールされなければインストールする 		
	apt list | grep -i ctags > /dev/null ; installed=$?
	echo "install ctags on ubuntu"
	if [ $installed != 0 ] 
	then
		sudo apt-get -y install exuberant-ctags gcc vim
	fi
elif [ $OS = "Mac" ]; then
	brew install ctags
else
	# ctags がインストールされなければインストールする 		
	yum list installed ctags > /dev/null ; installed=$?
	echo "install ctags on centos"
	if [ $installed != 0 ]
	then
		"hello now install ctags on yum"
		sudo yum install -y ctags gcc vim
	fi
fi
