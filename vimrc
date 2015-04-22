"Pathogen on -----------------------------------------------------------
execute pathogen#infect()

" Syntax Highlight -----------------------------------------------------
syntax on
"let python_highlight_all=1  " If you need more colorful python highlight

" Basic Environment ----------------------------------------------------
set ru
set nocp
set is
set nu
set encoding=utf-8
set backspace=indent,eol,start
set whichwrap=b,s,<,>,[,]
set cursorline
set nobackup
set autochdir
colorscheme molokai  " Setting your favorate color scheme such as desert
filetype plugin indent on

" TAB Settings ---------------------------------------------------------
set smarttab
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Gui and Terminal -----------------------------------------------------
if has("gui")
    set guifont=Powerline\ Consolas:h12
    set guioptions=m
else
    let g:indent_guides_auto_colors=0
    autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=gray
    autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=blue
endif

" Vim-airline Settings -------------------------------------------------
set laststatus=2

"You need install powerline fonts to turn on this option
let g:airline_powerline_fonts=1

let g:airline_theme="powerlineish"
" If you like airline tabline, you can use following option
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#buffer_nr_show = 1
"let g:airline#extensions#tabline#buffer_nr_format = '%s:'

" Highlight Current Columns by vimer.cn. -------------------------------
" Press ,ch to highlight current column
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

" Indent Guides settings -----------------------------------------------
let g:indent_guides_guide_size=1
let g:indent_guides_enable_on_vim_startup=1


" NERDTree Settings ----------------------------------------------------
nmap <leader>nt :NERDTreeToggle<cr>

" Tagbar Settings ------------------------------------------------------
"Change and turn on the following option in Windows and MacOS
"let g:tagbar_ctags_bin="/Users/snakesgun/.vim/bundle/tagbar/ctags"
nmap <leader>tb :TagbarToggle<cr>

" Gundo Settings -------------------------------------------------------
nmap <leader>gt :GundoToggle<cr>
" If you only have python3 and python3/dyn vim, turn on this option.
"let g:gundo_prefer_python3=1

" Vim-Jedi Settings -----------------------------------------------------
let g:jedi#popup_select_first = 0
autocmd FileType python setlocal completeopt-=preview
"Choose your python version
"let g:jedi#force_py_version = 3

" SuperTab Settings -----------------------------------------------------
let g:SuperTabDefaultCompletionType = "<c-n>"

" Bufferline Settings ---------------------------------------------------
"let g:bufferline_echo = 0
