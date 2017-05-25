" ビジュアルモードで選択したテキストが、クリップボードに入るようにする
" http://nanasi.jp/articles/howto/editing/clipboard.html
" set clipboard=autoselect 
" 無名レジスタに入るデータを、*レジスタにも入れる。
" set clipboard+=unnamed
set clipboard=unnamedplus
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
nnoremap sp gT
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>

set ignorecase
set smartcase
set incsearch
set hlsearch
set number
set tabstop=4
set shiftwidth=4
set mouse=a

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

