set nocompatible          " Turn off backwards compatibility for vi
filetype plugin indent on " Turn on filetype & plugin detection for indents
syntax on                 " Enable syntax highlighting

" Layout
set textwidth=100   " Auto line break pastes after 100 characters
set colorcolumn=80  " Highlight auto line break limit
set number          " Show line numbers on the left

"Tabs
set expandtab     " Hitting tab inserts spaces instead
set tabstop=2     " Width of TAB set to 2 spaces in insert mode
set softtabstop=2 " Width of TAB set to 2 spaces in editing modes
set shiftwidth=2  " Width of autoindent set to 2 spaces

" Colors
" Run :hi or :so $VIMRUNTIME/syntax/hitest.vim for color & group info
set background=dark
hi LineNr ctermbg=0 ctermfg=grey        " Set line numbers to grey
hi Search cterm=reverse                 " Reverse color on search terms
hi Comment cterm=reverse ctermfg=grey   " Set comments to grey & reverse
hi ColorColumn ctermbg=0                " Set the 80 character line to grey
hi Statusline cterm=none ctermbg=0      " Set statusline bg to black

" Search
set ignorecase                      " Ignore case...
set smartcase                       " Unless upper case is used
nnoremap <esc> :noh<return><esc>    " Press esc to clear search highlighting

" Folding
set foldmethod=indent   " Fold on indent...
set foldlevel=99        " For up to 99 indents
set foldlevelstart=10   " Open all folds less than 10 on file startup
set foldnestmax=10      " Don't nest lines with a fold amount greater than 10
nnoremap <space> za     " Use space to unfold instead of za

" Statusline

" Left-justified text
set laststatus=2        " Always show statusline
set statusline=         " Clear statusline for when init.vim is reloaded
set statusline+=%t\     " Show filename
set statusline+=%y\     " Show filetype

" Right-justified text
set statusline+=%=      " Right justify text
set statusline+=%p%%\   " Show percentage of lines through file

" File Search
set path+=**            " Search into subfolders of current path using :find
set wildmenu            " Tab iterates through matches using :find

 " Disable automatic commenting on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Remove trailing whitespace highlighting in Go
let g:go_highlight_trailing_whitespace_error=0

autocmd BufWritePre * %s/\s\+$//e " Auto delete trailing whitespace on save

" Language specific configurations
autocmd filetype markdown setlocal spell spelllang=en_us

autocmd filetype python,go  call AutoCloseCodePairs()
autocmd filetype python,go  call FourSpaces()
autocmd filetype go         :retab " Auto convert tabs to spaces on file open

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
