# yum の更新
$ sudo yum update -y

# yum から docker をインストール
$ sudo yum install -y docker

# docker サービスの起動
$ sudo service docker start
Starting cgconfig service:                                 [  OK  ]
Starting docker:                                           [  OK  ]
# ec2-user を docker グループに追加する
$ sudo usermod -a -G docker $USER

# Docker Composeをインストール
sudo curl -L "https://github.com/docker/compose/releases/download/1.12.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
# 1.12.0は記事公開時点での最新バージョン

sudo chmod +x /usr/local/bin/docker-compose

docker-compose --version
