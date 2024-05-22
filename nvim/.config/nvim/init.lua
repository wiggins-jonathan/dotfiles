local go = vim.opt  -- easily access global options
go.ignorecase = true  -- when searching ignore case...
go.smartcase  = true  -- unless uppercase is used
go.undofile = true  -- use undo file at $XDG_STATE_HOME/nvim/undo

local wo = vim.wo -- easily access windows-local options
wo.colorcolumn  = '80'
wo.number       = true
wo.cursorline   = true

local bo = vim.bo -- easily access buffer-local options
bo.smartindent  = true  -- dynamically adjust indent based on language
bo.expandtab    = true  -- hitting tab inserts space characters
bo.tabstop      = 2     -- width of tab set to 2 spaces when displayed
bo.softtabstop  = 2     -- width of tab set to 2 spaces in editing modes
bo.shiftwidth   = 2     -- width of tab set to 2 spaces in other modes

local map = vim.keymap.set  -- easily remap default keys
map('n', '<esc>', ':noh<return><esc>') -- double esc clears search highlighting

local autocmd = vim.api.nvim_create_autocmd -- easily create autocommands

-- highlight yanked text for 5 seconds
autocmd('TextYankPost', { pattern = '*', callback = function()
    vim.highlight.on_yank({ timeout = 5000 })
  end
})

-- remove autocomment on newline
autocmd('filetype', { pattern = '*', command = 'setlocal formatoptions-=cro'})
-- do not indent when commenting in yaml
autocmd('filetype', { pattern = 'yaml', command = 'setlocal indentkeys-=0#' })
-- remove trailing whitespace on write to file
autocmd('BufWritePre', { pattern = '*', command = '%s/\\s\\+$//e' })

-- auto `go fmt` when exiting go files
autocmd('BufWinLeave', { pattern = '*.go', command = '! go fmt % > /dev/null' })

-- filetype detection
local add = vim.filetype.add  -- easily add filetype detection
add({ extension  = { bean             = 'beancount' } })
add({ extension  = { tf               = 'terraform' } })
add({ extension  = { svelte           = 'html'      } })
add({ pattern    = { ['[Cc]addyfile'] = 'caddyfile' } })

-- if line ends in {, (, [, indent & close
autocmd('filetype', {
  pattern   = 'python,go,sh,css,svelte,caddyfile,terraform,lua,hcl',
  callback  = function()
    map('i', '{<CR>', '{<CR>}<ESC>O')
    map('i', '(<CR>', '(<CR>)<ESC>O')
    map('i', '[<CR>', '[<CR>]<ESC>O')
  end
})

-- languages where tab = 4 spaces
autocmd('filetype', { pattern = 'python,go', callback = function()
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
