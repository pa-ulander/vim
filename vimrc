set shell=/bin/sh
call pathogen#infect()

let mapleader=" "
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

"" Color
colorscheme Tomorrow-Night

"" Directories
set undofile
set directory=~/.vim/cache/swapdir//
set backupdir=~/.vim/cache/backupdir//
set undodir=~/.vim/cache/undodir
set undolevels=1000
set undoreload=10000
let g:unite_data_directory = '~/.vim/cache/unite'

let g:SuperTabDefaultCompletionType = ""

filetype plugin on
set omnifunc=syntaxcomplete#Complete

let g:phpqa_codesniffer_args = "--standard=PSR1"
let g:phpqa_messdetector_autorun = 0
let g:phpqa_codesniffer_autorun = 0


"" Airline
let g:airline#extensions#tabline#enabled = 1

"" Unite
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <leader>t :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
nnoremap <leader>r :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
nnoremap <leader>o :<C-u>Unite -auto-preview -buffer-name=outline -start-insert outline<cr>
nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
nnoremap <leader>e :<C-u>Unite -buffer-name=buffer  buffer<cr>
nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=grep -auto-preview -start-insert grep:.:-i<cr>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Play nice with supertab
  let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction

"Use ag for search
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

"remove max files from search
let g:unite_source_file_rec_max_cache_files = 0
call unite#custom#source('file_rec,file_rec/async', 'max_candidates', 0)

""router
let g:rooter_use_lcd = 1
