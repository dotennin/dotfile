# .bash_profile
# Get the aliases and functions
#「.bashrc」があったら読み込む。
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

export PATH
# ユーザーネーム変数の開放
unset USERNAME
