"Environment coding settings in windows
let $LANG="zh_CN.UTF-8"
set langmenu=zh_CN.utf-8
set encoding=utf-8
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

set nocompatible
source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

"Basic environment settings
set nocp
set ru
set is
syntax on
set backspace=indent,eol,start
set whichwrap=b,s,<,>,[,]
set guifont=Powerline\ Consolas:h12
"set encoding=utf-8
filetype plugin indent on
set cursorline
set nobackup
"set completeopt=longest,menu
colorscheme molokai
set nu
let python_highlight_all=1
"set nowrap
"set guioptions-=brR

"Indent Guides settings
let g:indent_guides_guide_size=1
let g:indent_guides_enable_on_vim_startup=1


"Indent settings
set et
set ts=4
set sw=4
set softtabstop=4

"Pathogen settings
execute pathogen#infect()

"vim-airline settings
set laststatus=2
let g:airline_theme="powerlineish"
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_nr_format = '%s:'

"Tagbar settings
"let g:tagbar_ctags_bin="C:/Users/Luming/vimfiles/ctags.exe"

" Highlight Current Columns by vimer.cn
map ,ch :call SetColorColumn()<CR>
function! SetColorColumn()
    let col_num = virtcol(".")
    let cc_list = split(&cc, ',')
    if count(cc_list, string(col_num)) <= 0
        execute "set cc+=".col_num
    else
        execute "set cc-=".col_num
    endif
endfunction

"Tagbar NERDTree and GundoTree toggle
nmap <leader>tb :TagbarToggle<cr>
nmap <leader>nt :NERDTree<cr>
nmap <leader>gt :GundoToggle<cr>
let g:gundo_prefer_python3=1

"Vim-Jedi settings
autocmd FileType python setlocal completeopt-=preview
let g:jedi#popup_select_first = 0

"Supertab settings
let g:SuperTabDefaultCompletionType = "<c-n>"
