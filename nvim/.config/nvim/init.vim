set textwidth=80        " Auto line break after 80 characters
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

highlight LineNr ctermfg=grey   " Change line numbers to grey

"==================="
"       Search      "
"==================="

set ignorecase      " Ignore case...
set smartcase       " Unless upper case is used
nnoremap <esc> :noh<return><esc> " Press esc to clear search highlighting
