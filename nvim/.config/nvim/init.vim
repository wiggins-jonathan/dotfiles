filetype plugin indent on
syntax on

set textwidth=80        " Auto line break pastes after 80 characters
set colorcolumn=80      " Highlight auto line break limit
set nu                  " Show line numbers on the left 
set foldmethod=indent   " Fold on indent...
set foldlevel=99        " For 99 indents

"================"
"       Tabs     " 
"================"

set expandtab       " Convert tabs to white space
set tabstop=4       " Use 4 spaces for tab
set shiftwidth=4    " Use 4 spaces for autoindent

"==================="
"       Colors      "
"==================="
" Run :hi or :so $VIMRUNTIME/syntax/hitest.vim for color & group info

set background=dark
hi LineNr ctermfg=grey      " Set line numbers to grey
hi Search cterm=underline   " Underline search terms
hi Search cterm=bold        " Bold search terms
hi Comment ctermfg=grey     " Set comments to grey
hi ColorColumn ctermbg=grey " Set the 80 character line to grey

"==================="
"       Search      "
"==================="

set ignorecase                      " Ignore case...
set smartcase                       " Unless upper case is used
nnoremap <esc> :noh<return><esc>    " Press esc to clear search highlighting
