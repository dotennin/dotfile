# yum の更新
CURRENT_USER=$USER
sudo yum update -y

# yum から docker をインストール
sudo yum install -y docker

# docker サービスの起動
sudo service docker start
# ec2-user を docker グループに追加する
cat /etc/group | grep docker > /dev/null; group_exsts=$?
if [ $group_exsts != 0 ]
then
	groupadd docker
fi
sudo usermod -a -G docker $CURRENT_USER

# Docker Composeをインストール
sudo curl -L "https://github.com/docker/compose/releases/download/1.12.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
# 1.12.0は記事公開時点での最新バージョン

sudo chmod +x /usr/local/bin/docker-compose

# # Docker-machine installer
# curl -L https://github.com/docker/machine/releases/download/v0.12.1/docker-machine-`uname -s`-`uname -m` >/tmp/docker-machine &&
#     chmod +x /tmp/docker-machine &&
#     sudo cp /tmp/docker-machine /usr/local/bin/docker-machine
