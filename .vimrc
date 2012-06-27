set nocompatible

" Bundle
source ~/.vimrc.bundle

" Color
syntax on
colorscheme molokai
"colorscheme jellybeans
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

" neocomplcache
let g:neocomplcache_enable_at_startup = 1 " 起動時に有効化


" NERDTree
"autocmd vimenter * if !argc() | NERDTree | endif
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"autocmd VimEnter * nmap <C-e> :NERDTreeToggle<CR>
"let g:NERDTreeIgnore=['\.clean$', '\.swp$', '\.bak$', '\~$']
"let g:NERDTreeShowHidden=1
"let g:NERDTreeMinimalUI=1
"let g:NERDTreeDirArrows=0
"let g:NERDTreeMouseMode=1
"let g:NERDTreeQuitOnOpen=1
"map <c-l> gt
"map <c-h> gT

" Nerd_Commenter
let g:NERDCreateDefaultMappings=0
let NERDSpaceDelims=1
nmap <Leader> <Plug>NERDCommenterToggle
vmap <Leader> <Plug>NERDCommenterToggle
nmap <Leader>a <Plug>NERDCommenterAppend
nmap <leader>9 <Plug>NERDCommenterToEOL
vmap <Leader>s <Plug>NERDCommenterSexy
vmap <Leader>b <Plug>NERDCommenterMinimal

" quickrun
let g:quickrun_config={'*': {'split':''}}
set splitbelow
set splitright

" syntastic
let g:syntastic_enable_signs=1
let g:syntastic_enable_highlighting=1
let g:syntastic_auto_loc_list=2

" PHP
let php_sql_query=1
let php_htmlInStrings=1
let php_folding = 1


" vimfilter
nnoremap <C-e> :VimFiler -buffer-name=explorer -split -winwidth=45 -toggle -no-quit<Cr>
autocmd! FileType vimfiler call g:my_vimfiler_settings()
function! g:my_vimfiler_settings()
  nmap     <buffer><expr><Cr> vimfiler#smart_cursor_map("\<Plug>(vimfiler_expand_tree)", "\<Plug>(vimfiler_edit_file)")
  nnoremap <buffer>s          :call vimfiler#mappings#do_action('my_split')<Cr>
  nnoremap <buffer>v          :call vimfiler#mappings#do_action('my_vsplit')<Cr>
endfunction

let my_action = { 'is_selectable' : 1 }
function! my_action.func(candidates)
  wincmd p
  exec 'split '. a:candidates[0].action__path
endfunction
call unite#custom_action('file', 'my_split', my_action)

let my_action = { 'is_selectable' : 1 }                     
function! my_action.func(candidates)
  wincmd p
  exec 'vsplit '. a:candidates[0].action__path
endfunction
call unite#custom_action('file', 'my_vsplit', my_action)



