##########################################
# To run: 
# curl -sSL https://gist.githubusercontent.com/sirkkalap/e87cd580a47b180a7d32/raw/d9c9ebae4f5cf64eed4676e8aedac265b5a51bfa/Install-Docker-on-Linux-Mint.sh | bash -x
##########################################

# Check that HTTPS transport is available to APT
CURRENT_USER=$USER
curl -sSL https://get.docker.com | sh

# Add current user to docker group
sudo usermod -aG docker $CURRENT_USER

# Docker Composeをインストール
sudo curl -L "https://github.com/docker/compose/releases/download/1.12.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
# 1.12.0は記事公開時点での最新バージョン

sudo chmod +x /usr/local/bin/docker-compose

# # Docker-machine installer
# curl -L https://github.com/docker/machine/releases/download/v0.12.1/docker-machine-`uname -s`-`uname -m` >/tmp/docker-machine &&
#     chmod +x /tmp/docker-machine &&
#     sudo cp /tmp/docker-machine /usr/local/bin/docker-machine
#
