""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""


" Disable vi compatibility. 
set nocompatible

" Enable type file detection. 
filetype on

" Enable and load plugins.
filetype plugin on

" Enable indentation rules that are file specific.
filetype indent on

" Turn syntax highlighting on.
syntax on

" Do not save backup files.
set nobackup

" Set the commands to save in history default number is 20.
set history=1000

" Enable utf encoding.
set encoding=utf-8


""""""""""""""""""""""""""""""
" Editor
""""""""""""""""""""""""""""""


" Add numbers to each line on the left-hand side.
set number

" New lines inherit the indentation of previous lines.
set autoindent

 " Set shift width to 4 spaces.
set shiftwidth=4

" When shifting lines, round to shiftwidth
set shiftround

" Set tab width to 4 columns.
set tabstop=4

" Use space characters instead of tabs.
set expandtab

" Use tabstop amount of spaces when pressing tab
set smarttab

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap

" Highlight cursor line
color nord
set cursorline



""""""""""""""""""""""""""""""
" Search
""""""""""""""""""""""""""""""


" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch


""""""""""""""""""""""""""""""
" Mappings
""""""""""""""""""""""""""""""


" Use 'jk' to escape insert mode
:inoremap jk <esc>

" Set leader to comma
let mapleader = ","

" Shortcut to turn off search highlight
nnoremap <leader>/ :nohlsearch<CR>

" Pressing o will open a new line above or below and escape.
nnoremap o o<esc>
nnoremap O O<esc>

" Shortcut to open vert and horiz splits
nnoremap <leader>\ :vsplit<CR>
nnoremap <leader>_ :split<CR>

" Navigate by using CTRL+j,k,l,h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Resize splits using CTRL+<arrow_keys>
noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w>>
noremap <c-right> <c-w><
