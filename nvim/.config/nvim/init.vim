set nocompatible          " Turn off backwards compatibility for vi
filetype plugin indent on " Turn on filetype & plugin detection for indents
syntax on                 " Enable syntax highlighting
colorscheme theme         " Define theme from $HOME/.config/nvim/colors/theme.vim

" Layout
set textwidth=100   " Auto line break pastes after 100 characters
set colorcolumn=80  " Highlight auto line break limit
set number          " Show line numbers on the left
set cursorline      " Highlight the line number the cursor is currently on

"Tabs
set expandtab     " Hitting tab inserts spaces instead
set tabstop=2     " Width of TAB set to 2 spaces in insert mode
set softtabstop=2 " Width of TAB set to 2 spaces in editing modes
set shiftwidth=2  " Width of autoindent set to 2 spaces

" Search
set ignorecase  " Ignore case...
set smartcase   " Unless upper case is used
" Press esc to clear search highlighting
nnoremap <esc> :noh<return><esc>

" Folding
set foldmethod=indent   " Fold on indent...
set foldlevel=99        " For up to 99 indents
set foldlevelstart=10   " Open all folds less than 10 on file startup
set foldnestmax=10      " Don't nest lines with a fold amount greater than 10
" Use space to unfold instead of za
nnoremap <space> za

" Statusline

" Left-justified text
set laststatus=2        " Always show statusline
set statusline=         " Clear statusline for when init.vim is reloaded
set statusline+=%t\     " Show filename
set statusline+=%y\     " Show filetype

" Right-justified text
set statusline+=%=      " Right justify text
set statusline+=%c\     " Show column number at cursor
set statusline+=%p%%\   " Show percentage of lines through file

" File Search
set path+=**  " Search into subfolders of current path using :find
set wildmenu  " Tab iterates through matches using :find

 " Disable automatic commenting on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Remove trailing whitespace highlighting in Go
let g:go_highlight_trailing_whitespace_error=0

autocmd BufWritePre * %s/\s\+$//e " Auto delete trailing whitespace on save

" Language specific configurations
autocmd filetype markdown setlocal spell spelllang=en_us

" Detect beancount files
au BufRead,BufNewFile *.bean set filetype=beancount

autocmd filetype python,go,sh,css call AutoCloseCodePairs()
autocmd filetype python,go        call FourSpaces()
autocmd filetype go               :retab " Auto convert tabs to spaces on file open

function FourSpaces()
  setlocal tabstop=4
  setlocal shiftwidth=4
  setlocal softtabstop=4
endfunction

" If line ends in parenthesis, bracket, or curly brace, indent & close
function AutoCloseCodePairs()
  inoremap {<CR> {<CR>}<ESC>O
  inoremap (<CR> (<CR>)<ESC>O
  inoremap [<CR> [<CR>]<ESC>O
endfunction
