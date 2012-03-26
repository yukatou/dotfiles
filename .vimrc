set nocompatible

"vundle
filetype off
set rtp+=~/.vim/vundle.git/
call vundle#rc()
Bundle 'git://github.com/Shougo/neocomplcache.git'
Bundle 'git://github.com/Shougo/unite.vim.git'
Bundle 'git://github.com/thinca/vim-ref.git'
Bundle 'git://github.com/thinca/vim-quickrun.git'
Bundle 'git://github.com/thinca/vim-template.git'
Bundle 'git://github.com/scrooloose/nerdtree.git'
Bundle 'git://github.com/scrooloose/syntastic.git'
Bundle 'git://github.com/tomasr/molokai.git'
Bundle 'git://github.com/Lokaltog/vim-powerline.git'
Bundle 'git://github.com/Townk/vim-autoclose.git'
Bundle 'git://github.com/vim-scripts/rails.vim.git'
Bundle 'git://github.com/vim-scripts/sudo.vim.git'
Bundle 'git://github.com/vim-scripts/eregex.vim.git'
"Bundle 'git://github.com/kana/vim-smartchr.git'
filetype plugin indent on     " required!

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

" neocomplcache
let g:neocomplcache_enable_at_startup = 1 " 起動時に有効化


" NERFTree
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
autocmd VimEnter * nmap <C-e> :NERDTreeToggle<CR>
let g:NERDTreeIgnore=['\.clean$', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowHidden=1
let g:NERDTreeMinimalUI=1
let g:NERDTreeDirArrows=0
let g:NERDTreeMouseMode=1
let g:NERDTreeQuitOnOpen=1
map <c-l> gt
map <c-h> gT

" quickrun
let g:quickrun_config={'*': {'split':''}}
set splitbelow
set splitright

" syntastic
let g:syntastic_enable_signs=1
let g:syntastic_enable_highlighting=1
let g:syntastic_auto_loc_list=2
