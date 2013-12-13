set shell=/usr/bin/sh
call pathogen#infect()

set nocompatible                " choose no compatibility with legacy vi
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=4 shiftwidth=4      " a tab is two spaces (or set this to 4)
set noexpandtab
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

set number
set relativenumber
set hidden

colorscheme Tomorrow-Night

set directory=~/.vim/swapdir//
set backupdir=~/.vim/backupdir//

set undofile
set undodir=~/.vim/undodir
set undolevels=1000
set undoreload=10000


let g:SuperTabDefaultCompletionType = ""

filetype plugin on
set omnifunc=syntaxcomplete#Complete

let g:phpqa_codesniffer_args = "--standard=PSR1"
let g:phpqa_messdetector_autorun = 0
let g:phpqa_codesniffer_autorun = 0
