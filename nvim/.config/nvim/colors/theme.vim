" Run :hi or :so $VIMRUNTIME/syntax/hitest.vim for color & group info
set background=dark

" Reset highlighting
hi clear
if exists("syntax_on")
  syntax reset
endif

" Colorscheme of nvim UI elements
hi LineNr       cterm=none ctermbg=black    ctermfg=darkGrey
hi Search       cterm=none ctermbg=darkRed  ctermfg=white
hi ColorColumn  cterm=none ctermbg=darkGrey
hi Statusline   cterm=none ctermbg=black
hi Visual       cterm=bold
hi CursorLine   cterm=none ctermbg=black    " Remove styling for cursorline
" Add styling for the line number that the cursor is currently on
hi CursorLineNr cterm=bold ctermfg=white

" General syntax highlighting
hi Comment    cterm=reverse   ctermfg=grey
hi underline  cterm=underline ctermfg=darkBlue

hi Statement  cterm=none  ctermfg=darkGreen
hi Constant   cterm=none  ctermfg=magenta
hi Type       cterm=none  ctermfg=white
hi PreProc    cterm=none  ctermfg=darkMagenta
hi Identifier cterm=none  ctermfg=darkBlue
hi Special    cterm=bold  ctermfg=darkMagenta


" Identify the syntax highlighting group used under the cursor with F10
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" <num> <name>
" 0     Black
" 1     DarkBlue
" 2     DarkGreen
" 3     DarkCyan
" 4     DarkRed
" 5     DarkMagenta
" 6     Brown, DarkYellow
" 7     LightGray, LightGrey, Gray, Grey
" 8     DarkGray, DarkGrey
" 9     Blue, LightBlue
" 10    Green, LightGreen
" 11    Cyan, LightCyan
" 12    Red, LightRed
" 13    Magenta, LightMagenta
" 14    Yellow, LightYellow
" 15    White
