let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" grep検索
nnoremap <silent> ,ug  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
" カーソル位置の単語をgrep検索
nnoremap <silent> ,uk :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>
" 大文字小文字を区別しない  
let g:unite_enable_ignore_case = 1  
let g:unite_enable_smart_case = 1
" ESCキーを2回押すと終了する  
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

" C-vで:vsplit open
augroup UniteSettingGroup
  autocmd!
  au FileType unite nnoremap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')
  au FileType unite inoremap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')
augroup END
