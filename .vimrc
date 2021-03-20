" 文字コードの指定
scriptencoding utf-8
" 色付け
syntax on
" ビジュアルモードで選択したテキストが、クリップボードに入るようにする
" http://nanasi.jp/articles/howto/editing/clipboard.html
" 無名レジスタに入るデータを、*レジスタにも入れる。 [window, linux]
" set clipboard=unnamed,autoselect
" set clipboard=unnamedplus


if has('macunix')
	" mac
	set clipboard=unnamed
else
	" linux
	set clipboard=unnamedplus
endif

"x キー削除でデフォルトレジスタに入れない
nnoremap x "_x
vnoremap x "_x
nnoremap D "_D

"c+a 文頭、c+e文末

"vv で行末まで選択
vnoremap v ^$h

"選択範囲のインデントを連続して変更
vnoremap < <gv
vnoremap > >gv

"" bash 風キーマップ
nnoremap <C-a> ^
nnoremap <C-e> $<Right>
inoremap <C-a> <C-o>^
inoremap <C-e> <C-o>$<Right>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-h> <BS>
inoremap <C-d> <Del>
inoremap <C-k> <C-o>D<Right>
inoremap <C-u> <C-o>d^
inoremap <C-w> <C-o>db

nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap st :<C-u>tabnew<CR>
nnoremap sn gt
nnoremap sp :<C-u>vsplit<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>

" スワップファイルを作成しない
set noswapfile
set ignorecase
set smartcase
set incsearch
set hlsearch
set number
set tabstop=2
set shiftwidth=2
" マウスモード有効
set mouse=a

" xtermとscreen対応
set ttymouse=xterm2

" MacVimやGVimを利用する際にIMEがモードの切替でオフとなる設定
set imdisable
" UTF-8文字化け対応
set termencoding=utf-8
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,cp932,sjis
set fileformats=unix,dos,mac

" 永続的Undoを有効にします
if has('persistent_undo')
  set undodir=~/.vim/undo
  set undofile 
endif

" $VIMRUNTIME/syntax/php.vim
"let g:php_baselib = 1
"let g:php_htmlInStrings = 1
"let g:php_noShortTags = 1
"let g:php_sql_query = 1
"let g:sql_type_default = 'mysql'

" ---------------------------------------------------
"  tag 定義
" ファイルタイプ毎 & gitリポジトリ毎にtagsの読み込みpathを変える
function! ReadTags(type)
    try
        execute "set tags=".$HOME."/dotfiles/.vim/userautoload/tags_files/".
              \ system("cd " . expand('%:p:h') . "; basename `git rev-parse --show-toplevel` | tr -d '\n'").
              \ "/" . a:type . "_tags"
    catch
        execute "set tags=./tags/" . a:type . "_tags;"
    endtry
endfunction

augroup TagsAutoCmd
    autocmd!
    autocmd BufEnter * :call ReadTags(&filetype)
augroup END

"-------------プラグイン-------------------------------------------------
runtime! .vim/userautoload/init/*.vim
runtime! .vim/userautoload/NeoBundle/init.vim

