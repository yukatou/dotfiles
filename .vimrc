if has('vim_starting')
  set nocompatible " Be iMproved
  set runtimepath+=~/.vim/neobundle.vim/ " Required:
endif

call neobundle#rc(expand('~/.vim/bundle/'))  " Required:

NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
NeoBundle 'tomasr/molokai'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'terryma/vim-multiple-cursors'

" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck


" Color
syntax on
colorscheme molokai
let g:molokai_original=0

" 全角スペースを視覚化
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=white
match ZenkakuSpace /　/

" Set
set number 
set ts=2 sw=2
set softtabstop=2
set expandtab
set autoindent
set smartindent
set laststatus=2
set encoding=utf-8
set t_Co=256
set listchars=eol:$,tab:>\ 
