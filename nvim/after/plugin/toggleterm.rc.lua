local status, toggleterm = pcall(require, "toggleterm")
if (not status) then return end
toggleterm.setup {}
vim.keymap.set('n', '<C-J>', '<Cmd>ToggleTerm<CR>')
vim.keymap.set('t', '<C-J>', '<Cmd>ToggleTerm<CR>')
