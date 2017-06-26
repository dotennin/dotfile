#! /bin/bash
apt-get -v > /dev/null && OS="ubuntu" || OS="centos"
if [ $OS = "ubuntu" ]
then
	# ctags がインストールされなければインストールする 		
	apt list | grep -i ctags > /dev/null ; installed=$?
	echo "install ctags on ubuntu"
	if [ $installed != 0 ] 
	then
		sudo apt-get -y install exuberant-ctags gcc vim
	fi
else
	# ctags がインストールされなければインストールする 		
	yum list installed ctags > /dev/null ; installed=$?
	echo "install ctags on ubuntu"
	if [ $installed != 0 ]
	then
		"hello now install ctags on yum"
		sudo yum install -y ctags gcc vim
	fi
fi
