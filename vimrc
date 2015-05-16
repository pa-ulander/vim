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
set backspace=indent,eol,start  " backspace through everything in insert mode
let yaifa_indentation=1
let yaifa_tab_width=4

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

"" Error color
hi clear SpellBad
hi SpellBad cterm=underline ctermfg=white ctermbg=red

"" Directories
set undofile
set directory=~/.vim/cache/swapdir//
set backupdir=~/.vim/cache/backupdir//
set undodir=~/.vim/cache/undodir
set undolevels=1000
set undoreload=10000
let g:unite_data_directory = '~/.vim/cache/unite'

filetype plugin on

let g:phpqa_codesniffer_args = "--standard=PSR1"
let g:phpqa_messdetector_autorun = 0
let g:phpqa_codesniffer_autorun = 0

"" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"" Syntastic checkers
let g:syntastic_javascript_checkers = ['eslint']

"" Airline
let g:airline#extensions#tabline#enabled = 1

"" Unite
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <leader>r :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:<cr>
nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files   -start-insert file:<cr>
nnoremap <leader>h :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
nnoremap <leader>e :<C-u>Unite -buffer-name=buffer  buffer<cr>
nnoremap <leader>g :<C-u>Unite -no-split -buffer-name=grep -auto-preview -start-insert grep:.:-i<cr>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
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

""autocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#disable_auto_complete = 1
let g:neocomplete#enable_auto_select = 0
inoremap <expr><C-p> neocomplete#start_manual_complete()
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType php setlocal omnifunc=phpcomplete_extended#CompletePHP

""custom maps
set wmw=0
noremap <C-J> <C-W>j<C-W>_
noremap <C-K> <C-W>k<C-W>_
noremap <C-L> <C-W>l
noremap <C-H> <C-W>h
