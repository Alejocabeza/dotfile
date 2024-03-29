local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Resize window using <ctrl> arrow keys
-- map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
-- map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
-- map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
-- map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move Lines
map("n", "<S-A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<S-A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<S-A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<S-A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<S-A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<S-A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- save file
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- duplicated line
map("n", "tt", ":t.<cr>")

-- Increment/decrement
map("n", "+", "<C-a>")
map("n", "-", "<C-x>")

-- Delete a word backwards
map("n", "dw", 'vb"_d')

-- Select all
map("n", "<C-a>", "gg<S-v>")

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
map("n", "<c-h>", "<C-w>h")
map("n", "<c-j>", "<C-w>j")
map("n", "<c-k>", "<C-w>k")
map("n", "<c-l>", "<C-w>l")

-- resized window
map("n", "<C-w><left>", "<C-w><")
map("n", "<C-w><rigth>", "<C-w>>")
map("n", "<C-w><up>", "<C-w>+")
map("n", "<C-w><down>", "<C-w>-")

-- Diagnostic
--  map("n", "<C-k>", function()
--  vim.diagnostic.goto_prev()
--  end, opts)
--
-- map("n", "<C-j>", function()
--  vim.diagnostic.goto_next()
-- end, opts)

-- map("n", "<leader>r", function()
-- 	require("craftzdog.utils").replaceHexWithHSL()
-- end)
