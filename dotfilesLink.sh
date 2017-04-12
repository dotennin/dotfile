#! /bin/bash
ln -sf ~/dotfiles/.vimrc ~/.vimrc
#ln -sf ~/dotfiles/.gvimrc ~/.gvimrc
ln -sf ~/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dotfiles/.bash_profile ~/.bash_profile
ln -sf ~/dotfiles/.vim ~/.vim
ln -sf ~/dotfiles/.ideavimrc ~/.ideavimrc
ln -sf ~/dotfiles/bat ~/bat
#ln -sf ~/dotfiles/.gitignore_global ~/.gitignore_global

#git サブモジュール導入
git pull && git submodule init && git submodule update && git submodule status

#カスタマイズライブラリの適用
cp -af ~/dotfiles/.vim/neosnippet-snippets/ ~/dotfiles/.vim/bundle/ 
