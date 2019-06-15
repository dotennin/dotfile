" set filetypes as typescript.tsx 
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx

" dark red 
hi tsxTagName guifg=#E06C75  
" orange 
hi tsxCloseString guifg=#F99575 
hi tsxCloseTag guifg=#F99575 
hi tsxAttributeBraces guifg=#F99575 
hi tsxEqual guifg=#F99575  
" yellow 
hi tsxAttrib guifg=#F8BD7F cterm=italic

" light-grey 
hi tsxTypeBraces guifg=#999999
" dark-grey
hi tsxTypes guifg=#666666

" other color
hi ReactState guifg=#C176A7 
hi ReactProps guifg=#D19A66 
hi Events ctermfg=204 guifg=#56B6C2 
hi ReduxKeywords ctermfg=204 guifg=#C678DD 
hi WebBrowser ctermfg=204 guifg=#56B6C2 
hi ReactLifeCycleMethods ctermfg=204 guifg=#D19A66
