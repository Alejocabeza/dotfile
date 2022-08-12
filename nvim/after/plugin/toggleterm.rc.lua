local status, toggleterm = pcall(require, "toggleterm")
if (not status) then return end
toggleterm.setup{}
vim.keymap.set('n', '<Leader>/', '<Cmd>ToggleTerm<CR>')
vim.keymap.set('t', '<Leader>/', '<Cmd>ToggleTerm<CR>')
