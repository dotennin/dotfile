" ビジュアルモードで選択したテキストが、クリップボードに入るようにする
" http://nanasi.jp/articles/howto/editing/clipboard.html
" set clipboard=autoselect 
" 無名レジスタに入るデータを、*レジスタにも入れる。
" set clipboard+=unnamed
set clipboard=unnamedplus
" 削除キーでyankしない
nnoremap x "_x
"nnoremap d "_d
nnoremap D "_D

"c+a 文頭、c+e文末

"vv で行末まで選択
vnoremap v ^$h

"選択範囲のインデントを連続して変更
vnoremap < <gv
vnoremap > >gv

""インサートモードで bash 風キーマップ
inoremap <C-a> <C-o>^
inoremap <C-e> <C-o>$<Right>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-h> <BS>
inoremap <C-d> <Del>
inoremap <C-k> <C-o>D<Right>
inoremap <C-u> <C-o>d^
inoremap <C-w> <C-o>db

set ignorecase
set smartcase
set incsearch
set hlsearch
set number
set tabstop=4
set shiftwidth=4

"-------------プラグイン-------------------------------------------------
if has('vim_starting')
   " 初回起動時のみruntimepathにneobundleのパスを指定する
   set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" NeoBundleを初期化
call neobundle#begin(expand('~/.vim/bundle/'))
"NeoBundleをNeoBundle自体で管理する
NeoBundleFetch 'Shougo/neobundle.vim'

" インストールするプラグインをここに記述
" ------------------------
"  vimで辞書をみるプラグイン
NeoBundle 'thinca/vim-ref'
" --------------------------
NeoBundle 'scrooloose/nerdtree'
"open a NERDTree automatically when vim starts up if no files were specified?
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"open a NERDTree automatically when vim starts up
"autocmd vimenter * NERDTree
" --------------------------------------------------
NeoBundle 'Shougo/unite.vim'
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" 大文字小文字を区別しない  
let g:unite_enable_ignore_case = 1  
let g:unite_enable_smart_case = 1
" ESCキーを2回押すと終了する  
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
" ---------------------------------------------------
" 自動補完
NeoBundle 'Shougo/neocomplete.vim'
highlight Pmenu ctermbg=4
highlight PmenuSel ctermbg=1
highlight PMenuSbar ctermbg=4

" 補完ウィンドウの設定
set completeopt=menuone

 " 補完ウィンドウの設定
set completeopt=menuone

 " rsenseでの自動補完機能を有効化
let g:rsenseUseOmniFunc = 1
 " let g:rsenseHome = '/usr/local/lib/rsense-0.3'

 " auto-ctagsを使ってファイル保存時にtagsファイルを更新
let g:auto_ctags = 1

 " 起動時に有効化
let g:neocomplcache_enable_at_startup = 1

 " 大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplcache_enable_smart_case = 1

 " _(アンダースコア)区切りの補完を有効化
let g:neocomplcache_enable_underbar_completion = 1

let g:neocomplcache_enable_camel_case_completion  =  1

 " 最初の補完候補を選択状態にする
let g:neocomplcache_enable_auto_select = 1

 " ポップアップメニューで表示される候補の数
let g:neocomplcache_max_list = 20

 " シンタックスをキャッシュするときの最小文字長
let g:neocomplcache_min_syntax_length = 3

 " 補完の設定
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby = '[^.*\t]\.\w*\|\h\w*::'

if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
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
" ファイルタイプ別のプラグイン/インデントを有効にする
filetype plugin indent on

call neobundle#end()
" NeoBundleCheck を走らせ起動時に未インストールプラグインをインストールする
"NeoBundleCheck



" rubyでのみvim-rubyを読み込む、遅延読み取り
"NeoBundleLazy 'vim-ruby/vim-ruby' ,{
"    "autoload" : {"filetypes" : ["ruby"]}
"}
