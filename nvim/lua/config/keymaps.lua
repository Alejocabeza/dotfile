local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- duplicated line
map("n", "tt", ":t.<cr>")

-- Increment/decrement
map("n", "+", "<C-a>")
map("n", "-", "<C-x>")

-- Delete a word backwards
map("n", "dw", 'vb"_d')

-- Select all
map("n", "<C-a>", "gg<S-v>G")

-- Jumplist
map("n", "<C-m>", "<C-i>", opts)

-- New Tab
map("n", "te", ":tabedit<Return>", opts)
map("n", "<Tab>", ":tabnext<Return>", opts)
map("n", "<s-Tab>", ":tabprev<Return>", opts)

-- Split window
map("n", "ss", ":split<Return>", opts)
map("n", "sv", ":vsplit<Return>", opts)

-- Move windows
map("n", "sh", "<C-w>h")
map("n", "sj", "<C-w>j")
map("n", "sk", "<C-w>k")
map("n", "sl", "<C-w>l")

-- resized window
map("n", "<C-w><left>", "<C-w><")
map("n", "<C-w><rigth>", "<C-w>>")
map("n", "<C-w><up>", "<C-w>+")
map("n", "<C-w><down>", "<C-w>-")

--Diagnostic
map("n", "<C-k>", function()
  vim.diagnostic.goto_prev()
end, opts)

map("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end, opts)

-- map("n", "<leader>r", function()
-- 	require("craftzdog.utils").replaceHexWithHSL()
-- end)
