----------------------------------------------------------------------------------------
-- Neovim Settings
----------------------------------------------------------------------------------------
local cmd = vim.cmd
local exec = vim.api.nvim_exec
local fn = vim.fn
local g = vim.g
local opt = vim.opt
----------------------------------------------------------------------------------------
-- General
----------------------------------------------------------------------------------------
g.mapleader = ' '                        -- change leader to a comma
opt.mouse = 'a'                          -- enable mouse support
opt.clipboard = 'unnamedplus'            -- copy/paste to system clipboard
opt.swapfile = false                     -- don't use swapfile
----------------------------------------------------------------------------------------
-- Neovim UI
----------------------------------------------------------------------------------------
opt.number = true                        -- show line number
opt.relativenumber = true                -- show line number
opt.showmatch = true                     -- highlight matching parenthesis
opt.foldmethod = 'marker'                -- enable folding (default 'foldmarker')
opt.splitright = true                    -- vertical split to the right
opt.splitbelow = true                    -- orizontal split to the bottom
opt.ignorecase = true                    -- ignore case letters when search
opt.smartcase = true                     -- ignore lowercase for the whole paattern
opt.linebreak = true                     -- wrap on word boundary
opt.conceallevel = 0
opt.termguicolors = true
opt.wrap = false
opt.list = true
opt.listchars = 'tab:▸ ,space:·,nbsp:␣,trail:•,precedes:«,extends:»'
opt.background = "dark"
----------------------------------------------------------------------------------------
-- Memory, CPU
----------------------------------------------------------------------------------------
opt.hidden = true                        -- enable background buffers
opt.history = 100                        -- remember n lines in history
opt.lazyredraw = true                    -- faster scrolling
opt.synmaxcol = 1000                     -- max column for syntax highlight
----------------------------------------------------------------------------------------
-- Tabs, indent
----------------------------------------------------------------------------------------
opt.expandtab = true                     -- use spaces instead of tabs
opt.shiftwidth = 4                       -- shift 4 spaces when tab
opt.tabstop = 4                          -- 1 tab == 4 space
opt.smartindent = true                   -- autoindent new lines
