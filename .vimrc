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
" 補完ウィンドウの設定
set completeopt=menuone
" 起動時に有効化
let g:neocomplcache_enable_at_startup = 1 
" 大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplcache_enable_smart_case = 1
" _(アンダースコア)区切りの補完を有効化
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_enable_camel_case_completion  =  1
" ポップアップメニューで表示される候補の数
let g:neocomplcache_max_list = 20
" シンタックスをキャッシュするときの最小文字長
let g:neocomplcache_min_syntax_length = 3
"tabで補完候補の選択を行う
inoremap <expr><TAB> pumvisible() ? "\<Down>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<Up>" : "\<S-TAB>"
"C-h, BSで補完ウィンドウを確実に閉じる
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<BS>"
" Rsense
let g:rsenseUseOmniFunc = 1
let g:rsenseHome = "/usr/local/Cellar/rsense/0.3/libexec"

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



