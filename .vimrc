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

"-------------プラグイン-------------------------------------------------
if has('vim_starting')
   " 初回起動時のみruntimepathにneobundleのパスを指定する
   set runtimepath+=~/dotfiles/.vim/bundle/neobundle.vim/
   "call neobundle#rc(expand('~/dotfiles/.vim/bundle/'))
endif

" NeoBundleを初期化
call neobundle#begin(expand('~/dotfiles/.vim/bundle/'))
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
"Vim unite-outlineでソースコード探索がラクチン
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'
"アウトラインを右側に出す。
let g:unite_split_rule = 'botright'

let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
noremap ,uo <ESC>:Unite -vertical -winwidth=40 outline<Return>
" 大文字小文字を区別しない  
let g:unite_enable_ignore_case = 1  
let g:unite_enable_smart_case = 1
" ESCキーを2回押すと終了する  
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
" ---------------------------------------------------
" 自動補完
NeoBundle 'Shougo/neocomplete.vim'
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
"増強plugin
NeoBundle 'Shougo/neosnippet'
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
 
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"
 
" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
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
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'Shougo/vimproc'
NeoBundle 'osyo-manga/shabadou.vim'
NeoBundle 'jceb/vim-hier'
NeoBundle 'dannyob/quickfixstatus'
NeoBundle 'osyo-manga/vim-watchdogs'
"let g:quickrun_config = { ... }
"call watchdogs#setup(g:quickrun_config)
" 書き込み後にシンタックスチェックを行う
let g:watchdogs_check_BufWritePost_enable = 1
" こっちは一定時間キー入力がなかった場合にシンタックスチェックを行う
" バッファに書き込み後、1度だけ行われる
let g:watchdogs_check_CursorHold_enable = 1
" ----------------------------------------------

call neobundle#end()
" ファイルタイプ別のプラグイン/インデントを有効にする
filetype plugin indent on
" NeoBundleCheck を走らせ起動時に未インストールプラグインをインストールする
NeoBundleCheck



" rubyでのみvim-rubyを読み込む、遅延読み取り
"NeoBundleLazy 'vim-ruby/vim-ruby' ,{
"    "autoload" : {"filetypes" : ["ruby"]}
"}
