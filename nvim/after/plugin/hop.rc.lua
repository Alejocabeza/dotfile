local status, hop = pcall(require, "hop")
if (not status) then return end

hop.setup({})

local opts = { noremap = false }

-- Normal Mode
vim.keymap.set('n', 'f', ':HopChar2AC<CR>', opts)
vim.keymap.set('n', 'F', ':HopChar2BC<CR>', opts)
