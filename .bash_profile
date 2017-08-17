# .bash_profile

# Get the aliases and functions
#「.bashrc」があったら読み込む。
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

export ANDROID_HOME=/home/$(whoami)/Android/Sdk
PATH=$PATH:$HOME/bin
PATH=${PATH}:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools
# [bin]ディレクトリがあったら読み込む。
export PATH
# ユーザーネーム変数の開放
unset USERNAME
