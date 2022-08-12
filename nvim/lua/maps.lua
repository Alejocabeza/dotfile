------------------------------------------------------------------------------------------------
-- Keymaps configuration file keymaps of neovim
------------------------------------------------------------------------------------------------
local keymap = vim.keymap
local opts = { noremap = true, silent = true }
local cmd = vim.cmd
------------------------------------------------------------------------------------------------
-- Neovim Shortcuts
------------------------------------------------------------------------------------------------
-- Exit/Save
keymap.set('n', '<Leader>q', ':q!<CR>')
keymap.set('n', '<Leader>w', ':w!<CR>')

-- Mapping ESC
keymap.set('i', 'qq', '<ESC>')
keymap.set('v', 'qq', '<ESC>')
keymap.set('c', 'qq', '<ESC>')

-- Duplicate line
keymap.set('n', 'tt', ':t.<CR>')

-- Do not yank with x
keymap.set('n', 'x', '"_x')

-- Increment/Decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d')

-- Select All
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- New Tab
keymap.set('n', 'te', ':tabedit<Return>', { silent = true })

-- Split Window
keymap.set('n', 'ss', ':split<Return><C-w>w', { silent = true })
keymap.set('n', 'sv', ':vsplit<Return><C-w>w', { silent = true })

-- Move Window
keymap.set('n', '<Space>', '<C-w>w')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')

-- Move Buffers
keymap.set('n', '<C-L>', ':tabnext<CR>', opts)
keymap.set('n', '<C-H>', ':tabprevious<CR>', opts)

-- Resize window
keymap.set('n', '<', '<C-w><')
keymap.set('n', '>', '<C-w>>')
keymap.set('n', '[', '<C-w>+')
keymap.set('n', ']', '<C-w>-')
