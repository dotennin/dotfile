let s:neobundle_path = expand('~/dotfiles/.vim/bundle')
let s:neobundle_repo_path = s:neobundle_path . '/neobundle.vim'

" neobundleなかったらcloneでもってくる
if !isdirectory(s:neobundle_repo_path)
  execute '!git clone https://github.com/Shougo/neobundle.vim' s:neobundle_repo_path
  execute '!~/dotfiles/dotfilesLink.sh'
endif

if has('vim_starting')
   " 初回起動時のみruntimepathにneobundleのパスを指定する
   set runtimepath+=~/dotfiles/.vim/bundle/neobundle.vim/
   "call neobundle#rc(expand('~/dotfiles/.vim/bundle/'))
endif

" NeoBundleを初期化
call neobundle#begin(expand('~/dotfiles/.vim/bundle/'))
"NeoBundleをNeoBundle自体で管理する
NeoBundleFetch 'Shougo/neobundle.vim'

" plugin insert
runtime! .vim/userautoload/NeoBundle/plugin.vim

call neobundle#end()
" ファイルタイプ別のプラグイン/インデントを有効にする
filetype plugin indent on
" NeoBundleCheck を走らせ起動時に未インストールプラグインをインストールする
NeoBundleCheck

" rubyでのみvim-rubyを読み込む、遅延読み取り
"NeoBundleLazy 'vim-ruby/vim-ruby' ,{
"    "autoload" : {"filetypes" : ["ruby"]}
"}

