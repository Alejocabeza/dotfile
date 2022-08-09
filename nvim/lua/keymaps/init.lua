----------------------------------------------------------------------------------------
-- Keymaps configuration file: keymaps of neovim
-- and plugins
----------------------------------------------------------------------------------------

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local cmd = vim.cmd

----------------------------------------------------------------------------------------
-- Neovim Shortcuts
----------------------------------------------------------------------------------------

-- Mapping for exit and save a file
map('n', '<leader>q', ':q!<CR>', opts)
map('n', '<Leader>w', ':w!<CR>', opts)

-- Mapping for clone a line
map('n', 'tt', ':t.<CR>', opts)

-- Mapping for exit of mode
map('i', 'qq', '<ESC>', opts)
map('v', 'qq', '<ESC>', opts)
map('c', 'qq', '<ESC>', opts)

-- Mapping for reload neovim
map('n', '<C-F5>', ':source %<CR>', opts)

-- Mapping for installing new plugin
map('n', '<C-F8>', ':PackerInstall<CR>', opts)
map('n', '<C-F9>', ':PackerUpdate<CR>', opts)
map('n', '<C-F10>', ':PackerClean<CR>', opts)

-- Mapping for add point coma
map('n', '<Leader>;', '$a;<ESC>', opts)

-- Run Current File
map('n', '<Leader>x', ':!node %<CR>', opts)

-- neo tree
map('n', '<Leader>e', ':Neotree right<CR>', opts)
map('n', '<leader>g', ':Neotree git_status left<cr>', opts)

-- Tmux Navigation
map('n', '<leader><C-h>', ':TmuxNavigationLeft', opts)
map('n', '<leader><C-j>', ':TmuxNavigationDown', opts)
map('n', '<leader><C-k>', ':TmuxNavigationUp', opts)
map('n', '<leader><C-l>', ':TmuxNavigationRight', opts)

-- easy motion
map('n', '<leader>s', '<Plug>(easymotion-s2)', opts)

--telescope
map('n', '<C-P>', ':Telescope git_files hidden=true<CR>', opts)

-- move buffers
map('n', '<Leader>h', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<Leader>l', '<Cmd>BufferNext<CR>', opts)

-- close buffers
map('n', 'x', '<Cmd>BufferClose<CR>', opts)

-- diff view
map('n', '<Leader>m', ':DiffviewOpen<CR>', opts)
map('n', '<Leader>P', ':DiffviewFileHistory<CR>', opts)
map('n', '<Leader>Q', ':DiffviewClose<CR>', opts)

-- terminal
map('n', '<Leader>/', '<Cmd>ToggleTerm<CR>', opts)
map('t', '<Leader>/', '<Cmd>ToggleTerm<CR>', opts)

-- lazygit
map('n', '<leader>gg', ':LazyGit<CR>', opts)

-- comment code 
map('n', '//', ':Commentary<CR>', opts)
map('v', '//', ':Commentary<CR>', opts)

-- Increment/Decrement
map('n', '+', '<C-a>', opts )
map('n', '-', '<C-x>', opts )

-- Delete a word backwards
map('n', 'dw', 'vb"_d', opts)

-- Select all
map('n', '<C-a>', 'gg<S-v>G', opts)

-- New Tab
map('n', 'te', ':tabedit<Return>', opts)
map('n', 'ss', ':split<Return><C-w>w', opts)
map('n', 'sv', ':vsplit<Return><C-w>w', opts)

-- Reslize window
map('n', '<', '<C-w><', opts)
map('n', '>', '<C-w>>', opts)
