local go  = vim.opt         -- global options
local wo  = vim.wo          -- windows-local options
local bo  = vim.bo          -- buffer-local options
local map = vim.keymap.set  -- remap default keys

vim.cmd('colorscheme theme')

wo.colorcolumn  = '80'  -- highlight column 80
wo.number       = true  -- show line numbers on left
wo.cursorline   = true  -- highlight the line number cursor is currently on

-- tabs
bo.expandtab    = true  -- hitting tab inserts spaces instead
bo.tabstop      = 2     -- width of TAB set to 2 spaces in insert mode
bo.softtabstop  = 2     -- width of TAB set to 2 spaces in editing modes
bo.shiftwidth   = 2     -- width of autoindent set to 2 spaces
bo.smartindent  = true

-- search
go.ignorecase  = true  -- when searching, ignore case...
go.smartcase   = true  -- unless upper case is used
map('n', '<esc>', ':noh<return><esc>') -- <esc> clears search highlighting

-- folding
wo.foldmethod     = 'indent'  -- fold on indent...
wo.foldlevel      = 99        -- for up to 99 indents
go.foldlevelstart = 10        -- open all folds less than 10 on file open
wo.foldnestmax    = 10        -- don't nest lines with fold amount > 10
map('n', '<space>', 'za')     -- use space to unfold instead of za

-- filetype detection
vim.g.do_filetype_lua = 1
local add = vim.filetype.add
add({ extension  = { bean             = 'beancount' } })
add({ extension  = { tf               = 'terraform' } })
add({ extension  = { svelte           = 'html'      } })
add({ pattern    = { ['[Cc]addyfile'] = 'caddyfile' } })

local autocmd = vim.api.nvim_create_autocmd

-- highlight yanked text
autocmd('TextYankPost', { pattern = '*', callback = function()
  vim.highlight.on_yank({ timeout = 10000 }) -- 10 seconds
  end
})

-- Disable automatic commenting on newline
autocmd('filetype', { pattern = '*', command = 'setlocal formatoptions-=cro' })

-- remove trailing whitespace on save
autocmd('BufWritePre', { pattern = '*', command = '%s/\\s\\+$//e' })

-- if line ends in {, (, [, indent & close
autocmd('filetype', {
  pattern   = 'python,go,sh,css,svelte,caddyfile,terraform,lua',
  callback  = function()
    map('i', '{<CR>', '{<CR>}<ESC>O')
    map('i', '(<CR>', '(<CR>)<ESC>O')
    map('i', '[<CR>', '[<CR>]<ESC>O')
  end
})

-- languages where tab = 4 spaces
autocmd('filetype', {
  pattern   = 'python,go',
  callback  =  function()
    bo.tabstop      = 4
    bo.softtabstop  = 4
    bo.shiftwidth   = 4
  end
})

-- statusline
local filename      = '%t'
local filetype      = '%y'
local separator     = '%='
local columnNumber  = '%c'
local percentDone   = '%p%%'
local space         = ' '
go.statusline = table.concat({
  filename, space, filetype, separator, columnNumber, space, percentDone
})
