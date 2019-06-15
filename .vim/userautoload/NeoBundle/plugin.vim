" インストールするプラグインをここに記述
" ------------------------
"  vimで辞書をみるプラグイン
NeoBundle 'thinca/vim-ref'
" --------------------------
NeoBundle 'scrooloose/nerdtree'
source ~/dotfiles/.vim/userautoload/plugins/plugins-nerdtree.vim
" --------------------------------------------------
"Vim unite-outlineでソースコード探索がラクチン
NeoBundle 'Shougo/unite.vim'
source ~/dotfiles/.vim/userautoload/plugins/plugins-unite.vim
NeoBundle 'Shougo/unite-outline'
source ~/dotfiles/.vim/userautoload/plugins/plugins-unite-outline.vim
" ---------------------------------------------------
" 自動補完
NeoBundle 'Shougo/neocomplete.vim'
source ~/dotfiles/.vim/userautoload/plugins/plugins-neocomplete.vim
"増強plugin
NeoBundle 'Shougo/neosnippet'
source ~/dotfiles/.vim/userautoload/plugins/plugins-neosnippet.vim
"ライブラリPlugin
NeoBundle 'Shougo/neosnippet-snippets'
" -------------------------------------------------
" -------------------------------------------------
"  ビジュアルモードで選択した範囲を*で検索できるようにする
NeoBundle 'nelstrom/vim-visual-star-search'
" ----------------------------------------------
"abcというテキストに対して、ビジュアルモードで選択した状態から、s"と入力する"と"abc"と一発で囲むことも出来ます。
" url= http://vimblog.hatenablog.com/entry/vim_plugin_surround_vim
NeoBundle 'tpope/vim-surround'
" ----------------------------------------------
"  括弧自動補完
NeoBundle 'Townk/vim-autoclose'
" ----------------------------------------------
"  HTMLの補完
"div>ul>li*5
NeoBundle 'mattn/emmet-vim'
" ----------------------------------------------
"テンプレートエンジンにSmarty
NeoBundle 'vim-scripts/smarty-syntax'
" ----------------------------------------------
"コメントアウト
"  <c-/> or <gc>
NeoBundle 'tomtom/tcomment_vim'
" ----------------------------------------------
"複数行になっているものを1行にまとめたり、その逆ができるプラグイン。 
"    gS to split a one-liner into multiple lines
"    gJ (with the cursor on the first line of a block) to join a block into a single-line statement.
NeoBundle 'AndrewRadev/splitjoin.vim'
" ----------------------------------------------
"  構文チェック
NeoBundle 'scrooloose/syntastic'
source ~/dotfiles/.vim/userautoload/plugins/plugins-syntastic.vim
" ----------------------------------------------
" 複数単語のハイライト表示（vim-quickhl）
NeoBundle "t9md/vim-quickhl"
source ~/dotfiles/.vim/userautoload/plugins/plugins-vim-quickhl.vim
" ----------------------------------------------
" ファイル絞りこみ検索
NeoBundle 'kien/ctrlp.vim'
source ~/dotfiles/.vim/userautoload/plugins/plugins-ctrlp.vim
" ----------------------------------------------
"  TS ファイル対応
NeoBundle 'leafgarland/typescript-vim'
source ~/dotfiles/.vim/userautoload/plugins/plugins-typescript-vim
"  .TSX
NeoBundle 'peitalin/vim-jsx-typescript'
source ~/dotfiles/.vim/userautoload/plugins/peitalin-vim-jsx-typescript
