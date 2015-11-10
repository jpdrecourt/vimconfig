" .vimrc file by Jean-Philippe Drecourt
" Heavily inspired by Martin Brochhaux (Pycon APAC 2012)

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Mouse
set mouse=a

" Removes highlight of last search (nohl)
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

" bind Ctrl+<movement> keys to move around the windows, instead of using
" Ctrl+w + <movement>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation                

" Color scheme
set t_Co=256
color wombat256mod

" Pathogen for plugins
call pathogen#infect()

" Syntax highlighting
filetype off
syntax on
filetype plugin indent on

" Showing line numbers and length
set number  " show line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233

" Undo settings
set history=700
set undolevels=700

" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

" Save and retrive session session.vim in directory where vim was invoked
" Allows for different sessions according to directory
" F2 to recover the session, <Leader><F2> to save the session (it overwrites!)
let SessionDir = getcwd()
map <Leader><F2> :mksession! <C-R>=SessionDir<cr>/session.vim<cr>
map <F2> :source <C-R>=SessionDir<cr>/session.vim <cr>


" Use keywords from Octave syntax language file for autocomplete 
" Autocomplete used with Ctrl-x Ctrl-o
if has("autocmd") && exists("+omnifunc") 
   autocmd Filetype octave 
   \   if &omnifunc == "" | 
   \    setlocal omnifunc=syntaxcomplete#Complete | 
   \    endif 
endif 

" Markdown syntax highlighting
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

" ======== Python IDE =======

" vim-powerline
set laststatus=2

" Settings for ctrlp - Fuzzy finder for VIM :CtrlP
let g:ctrlp_max_height = 30

set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

" Settings for jedi-vim - Auto fill - Ctrl + Space
let g:jedi#usages_command = "<leader>z"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0

" Debugging with pudb - Leader b to add breakpoint
map <Leader>b Oimport pudb; pudb.set_trace() # BREAKPOINT<C-c>


" Python folding
" F to toggle all folds / f to toggle fold under the cursor
set nofoldenable

" Flake8 Python syntax checker - Use F7 to check file
" No special setup
