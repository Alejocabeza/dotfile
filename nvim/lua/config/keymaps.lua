local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- duplicated line
keymap.set("n", "tt", ":t.<cr>")

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>")

-- Jumplist
keymap.set("n", "<C-m>", "<C-i>", opts)

-- New Tab
keymap.set("n", "te", ":tabedit<Return>", opts)
keymap.set("n", "<Tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-Tab>", ":tabprev<Return>", opts)

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Move windows
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-l>", "<C-w>l")

-- resized window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><rigth>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- Diagnostic
-- keymap.set("n", "<C-k>", function()
  -- vim.diagnostic.goto_prev()
-- end, opts)

-- keymap.set("n", "<C-j>", function()
  -- vim.diagnostic.goto_next()
-- end, opts)

keymap.set("n", "<leader>r", function()
  require("craftzdog.utils").replaceHexWithHSL()
end)
