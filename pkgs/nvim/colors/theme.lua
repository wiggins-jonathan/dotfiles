-- Run :hi or :so $VIMRUNTIME/syntax/hitest.vim for color & group info
vim.cmd("set background=dark")

-- Reset highlighting
vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

-- Colorscheme of nvim UI elements
vim.cmd("hi LineNr       cterm=none ctermbg=black    ctermfg=darkGrey")
vim.cmd("hi Search       cterm=none ctermbg=darkRed  ctermfg=white")
vim.cmd("hi ColorColumn  cterm=none ctermbg=darkGrey")
vim.cmd("hi Statusline   cterm=none ctermbg=black")
vim.cmd("hi Visual       cterm=bold")
-- Remove styling for cursorline
vim.cmd("hi CursorLine   cterm=none ctermbg=black")
-- Add styling for the line number that the cursor is currently on
vim.cmd("hi CursorLineNr cterm=bold ctermfg=white")

-- General syntax highlighting
vim.cmd("hi Comment    cterm=reverse   ctermfg=grey")
vim.cmd("hi underline  cterm=underline ctermfg=darkBlue")
vim.cmd("hi Special    cterm=bold      ctermfg=darkMagenta")

vim.cmd("hi Statement  cterm=none  ctermfg=darkGreen")
vim.cmd("hi Constant   cterm=none  ctermfg=magenta")
vim.cmd("hi Type       cterm=none  ctermfg=white")
vim.cmd("hi PreProc    cterm=none  ctermfg=blue")
vim.cmd("hi Identifier cterm=none  ctermfg=darkBlue")
vim.cmd("hi Operator   cterm=none  ctermfg=darkMagenta")

-- <num> <name>
-- 0     Black
-- 1     DarkRed
-- 2     DarkGreen
-- 3     DarkCyan
-- 4     DarkBlue
-- 5     DarkMagenta
-- 6     Brown, DarkYellow
-- 7     LightGray, LightGrey, Gray, Grey
-- 8     DarkGray, DarkGrey
-- 9     Blue, LightBlue
-- 10    Green, LightGreen
-- 11    Cyan, LightCyan
-- 12    Red, LightRed
-- 13    Magenta, LightMagenta
-- 14    Yellow, LightYellow
-- 15    White
