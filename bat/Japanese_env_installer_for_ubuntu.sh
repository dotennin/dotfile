#１．Japanese Teamの追加パッケージを設定
wget -q https://www.ubuntulinux.jp/ubuntu-ja-archive-keyring.gpg -O- | sudo apt-key add -
wget -q https://www.ubuntulinux.jp/ubuntu-jp-ppa-keyring.gpg -O- | sudo apt-key add -
sudo wget https://www.ubuntulinux.jp/sources.list.d/bionic.list -O /etc/apt/sources.list.d/ubuntu-ja.list
sudo apt update
sudo apt upgrade -y
sudo apt install ubuntu-defaults-ja -y

# ２．fcitx-mozcのインストール
sudo apt install fcitx fcitx-mozc -y

# ３．日本語フォントをインストール
sudo apt install fonts-noto-cjk fonts-noto-color-emoji

# ４．日本語ロケールに設定
sudo update-locale LANG=ja_JP.UTF8

# 5 本語変換を利用する設定 fcitxを起動する
# ※fcitx-autostartは自動起動させたいですが、.bashrcなどに書くとX環境を使っていないときに端末が立ち上がらなくなります。 なので、Windows側でVcXsrvを立ち上げた後にコマンドを実行してやります。
fcitx-autostart
# 下記コマンドを実行して、入力メソッドの設定を開きます。 左下の「＋」ボタンから、Mozcを追加してください。
fcitx-config-gtk3
