# ----------------------------------------------------
#  tagを生成する
# ----------------------------------------------------

# 言語
# see also `ctags --list-languages`
lang := PHP    \
        Ruby   \
        Python \
        Perl   \
		JavaScript

lower_lang := $(shell echo $(lang) | tr A-Z a-z)

# 各言語のtag対象ファイルの拡張子
# see also `ctags --list-maps`
ext := .php.php3.phtml.ctp   \
       .rb.ruby.spec \
       default       \
       default       \
	   .js

TARGET_PATH  = $(PWD)  # ここは基本的に書き換える
git_toplevel = $(shell cd $(TARGET_PATH);git rev-parse --show-toplevel)
seq          = $(shell seq 1 $(words $(lang)))

ifeq ($(git_toplevel),)
    # gitリポジトリ管理ではない場合
    tags_save_dir = $(realpath $(TARGET_PATH))/tags
    tags_target_dir = $(realpath $(TARGET_PATH))
else
    # gitリポジトリ管理である場合
    tags_save_dir = $(HOME)/dotfiles/.vim/userautoload/tags_files/$(shell basename $(git_toplevel))
    tags_target_dir = $(git_toplevel)
endif
install:
	~/dotfiles/dotfilesLink.sh
	~/dotfiles/bat/ctag_installer.sh
	~/dotfiles/dotfilesLink.sh
	~/dotfiles/wls.sh

.PHONY: create_tags $(seq)
create_tags: $(seq)
$(seq):
	mkdir -p $(tags_save_dir)
	ctags -R \
		--languages=$(word $@,$(lang)) \
      	--langmap=$(word $@,$(lang)):$(word $@,$(ext)) \
      	-f $(tags_save_dir)/$(word $@,$(lower_lang))_tags $(tags_target_dir)
