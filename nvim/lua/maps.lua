local keymap = vim.keymap

-- Save\Exit
keymap.set('n', 'q', ':q!<CR>')
keymap.set('n', 'w', ':w!<CR>')

-- return the mode normal
keymap.set('i', 'qq', '<ESC>')
keymap.set('v', 'qq', '<ESC>')
keymap.set('c', 'qq', '<ESC>')

-- duplicate line
keymap.set('n', 'tt', ':t.<CR>')

keymap.set('n', 'x', '"_x')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- New tab
keymap.set('n', 'te', ':tabedit<Return><CR>')
-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')
-- Move window
keymap.set('n', '<Space>', '<C-w>w')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')

-- Resize window
keymap.set('n', '<', '<C-w><')
keymap.set('n', '>', '<C-w>>')
keymap.set('n', '[', '<C-w>+')
keymap.set('n', ']', '<C-w>-')
