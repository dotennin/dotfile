##########################################
# To run: 
# curl -sSL https://gist.githubusercontent.com/sirkkalap/e87cd580a47b180a7d32/raw/d9c9ebae4f5cf64eed4676e8aedac265b5a51bfa/Install-Docker-on-Linux-Mint.sh | bash -x
##########################################

# Check that HTTPS transport is available to APT
if [ ! -e /usr/lib/apt/methods/https ]; then
	sudo apt-get update
	sudo apt-get install -y apt-transport-https
fi

# Add the repository to your APT sources
sudo echo deb https://get.docker.com/ubuntu docker main > /etc/apt/sources.list.d/docker.list

# Then import the repository key
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9

# Install docker
sudo apt-get update
sudo apt-get install -y docker.io cgroup-lite apparmor docker-compose

#
# Alternatively, just use the curl-able install.sh script provided at https://get.docker.com
#

echo Add group docker to current user
sudo usermod -a -G docker $USER

# Docker Composeをインストール
sudo curl -L "https://github.com/docker/compose/releases/download/1.12.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
# 1.12.0は記事公開時点での最新バージョン

sudo chmod +x /usr/local/bin/docker-compose

# # Docker-machine installer
# curl -L https://github.com/docker/machine/releases/download/v0.12.1/docker-machine-`uname -s`-`uname -m` >/tmp/docker-machine &&
#     chmod +x /tmp/docker-machine &&
#     sudo cp /tmp/docker-machine /usr/local/bin/docker-machine
#
