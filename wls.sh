#! /bin/bash

# Install vim-gtk for clipboard support. 
# If it is supported, it will be displayed as + clipboard like this.
apt update
apt upgrade
apt purge vim
apt install vim-gtk
vim --version | grep clip

# 日本語化する
sudo apt -y install language-pack-ja
sudo update-locale LANG=ja_JP.UTF8
sudo apt -y install manpages-ja manpages-ja-dev

# WSL2のPATHからWindowsパスを抜く
grep "appendWindowsPath" /etc/wsl.conf >> /dev/null
if [ $? = 1 ]; then
	cat <<-EOF > /etc/wsl.conf
[interop]
appendWindowsPath = false
EOF
fi


