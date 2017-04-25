# .bash_profile

# Get the aliases and functions
#「.bashrc」があったら読み込む。
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi
#nohup ~/bat/LicenseServer_linux_amd64 >> ~/bat/logs
PATH=$PATH:$HOME/bin
# [bin]ディレクトリがあったら読み込む。
export PATH
# ユーザーネーム変数の開放
unset USERNAME
