set nocompatible 
set history=200
set nu
syntax on
set ruler
set smartindent
set shiftwidth=4 softtabstop=4 expandtab
set scrolloff=5

"colorscheme desert 
colorscheme molokai 
set incsearch
set ruler   
set cmdheight=2
set guicursor=n-i-v-c:block10-Cursor-blinkon0
set foldmethod=syntax
set foldlevelstart=99

let &termencoding=&encoding
set fileencodings=utf-8,gb18030,gbk,gb2312,big5
" add line17~18 to support the gbk

if has("gui_running")
    set lines=45 columns=90
"    set guifont=Menlo:h18
    set guifont=SFMono-Regular:h20
    set guioptions-=m
    set guioptions-=T
    set guioptions-=L
    set guioptions-=r
    set guioptions-=b
    set showtabline=0
endif

let g:rehash256 = 1

