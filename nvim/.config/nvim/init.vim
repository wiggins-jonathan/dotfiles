filetype plugin indent on   " Turn on filetype & plugin detection for indents 
syntax on                   " Enable syntax highlighting

"==================="
"       Layout      "
"==================="

set textwidth=80        " Auto line break pastes after 80 characters
set colorcolumn=80      " Highlight auto line break limit
set number              " Show line numbers on the left 

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
hi LineNr ctermfg=grey                  " Set line numbers to grey
hi Search cterm=bold                    " Bold search terms
hi Comment ctermfg=grey                 " Set comments to grey
hi ColorColumn ctermbg=grey             " Set the 80 character line to grey
hi Statusline cterm=none ctermbg=black  " Statusline 

"==================="
"       Search      "
"==================="

set ignorecase                      " Ignore case...
set smartcase                       " Unless upper case is used
nnoremap <esc> :noh<return><esc>    " Press esc to clear search highlighting

"==================="
"       Folding     "
"==================="

set foldmethod=indent   " Fold on indent...
set foldlevel=99        " For 99 indents
set foldlevelstart=10   " Open all folds less than 10 on file startup
set foldnestmax=10      " Don't nest lines with a fold amount greater than 10
nnoremap <space> za     " Use space to unfold instead of za

"======================="
"       Statusline      "
"======================="

" Left-justified text
set laststatus=2        " Always show statusline
set statusline=         " Clear statusline for when init.vim is reloaded
set statusline+=%t\     " Show filename
set statusline+=%y\     " Show filetype

" Right-justified text
set statusline+=%=      " Right justify text 
set statusline+=%p%%\   " Show percentage of lines through file
