vim.cmd('autocmd!')
-----------------------------------------------------------------------------------------------------------
-- Global Variables
-----------------------------------------------------------------------------------------------------------
local cmd = vim.cmd
local exec = vim.api.nvim_exec
local fn = vim.fn
local g = vim.g
local opt = vim.opt
local wo = vim.wo
-----------------------------------------------------------------------------------------------------------
-- General
-----------------------------------------------------------------------------------------------------------
vim.scriptencoding = 'utf-8'
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'
g.mapleader = ' '
opt.mouse = 'a'
opt.swapfile = false

-- Undercurl
cmd([[ let &t_Cs = "\e[4:3m"]])
cmd([[ let &t_Ce = "\e[4:0m"]])

-- turn off paste mode when leaving insert
vim.api.nvim_create_autocmd( "InsertLeave", { pattern = '*', command = "set nopaste" })

-- Add asterisks in block comments
opt.formatoptions:append { 'r' }
-----------------------------------------------------------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------------------------------------------------------
wo.number = true
opt.title = true
opt.hlsearch = true
opt.showcmd = true
opt.laststatus = 2
opt.scrolloff = 10
opt.inccommand = 'split'
opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
opt.wrap = false -- No wrap lines
opt.foldmethod = 'marker'
opt.splitright = true
opt.splitbelow = true
opt.linebreak = true
opt.conceallevel = 0
opt.list = true
opt.listchars = 'tab:▸ ,space:·,nbsp:␣,trail:•,precedes:«,extends:»'
opt.background = "dark"
opt.cursorline = true
opt.termguicolors = true
opt.winblend = 0
opt.wildoptions = 'pum'
opt.pumblend = 5
opt.clipboard:append { 'unnamed', 'unnamedplus' }
opt.guicursor = ('n-v-c-i:block')
-----------------------------------------------------------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------------------------------------------------------
opt.backup = false
opt.cmdheight = 1
opt.wildignore:append { '*/node_modules/*' }
opt.hidden = true                        -- enable background buffers
opt.history = 100                        -- remember n lines in history
opt.lazyredraw = true                    -- faster scrolling
opt.synmaxcol = 1000
-----------------------------------------------------------------------------------------------------------
-- Tabs, Indent
-----------------------------------------------------------------------------------------------------------
opt.autoindent = true
opt.smartindent = true
opt.expandtab = true
opt.smarttab = true
opt.breakindent = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.backspace = { 'start', 'eol', 'indent' }
opt.path:append { '**' } -- Finding files - Search down into subfolders
