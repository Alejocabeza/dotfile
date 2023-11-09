local keymap = vim.keymap
vim.g.mapleader = " "

keymap.set("n", "x", '"_x')

-- copy line
keymap.set("n", "tt", ":t.<cr>")

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- New tab
keymap.set("n", "te", "<cmd>tabnew<cr>")
keymap.set("n", "tw", "<cmd>tabclose<cr>")
keymap.set("n", "tf", "<cmd>tabnew %<cr>")
keymap.set("n", "<Tab>", "<cmd>tabn<cr>")
keymap.set("n", "<S-Tab>", "<cmd>tabp<cr>")

-- Split window
keymap.set("n", "ss", ":split<Return><C-w>w")
keymap.set("n", "sv", ":vsplit<Return><C-w>w")
keymap.set("n", "sw", "<cmd>close<cr>")

-- Move window
keymap.set("n", "<Space>", "<C-w>w")
keymap.set("", "sh", "<C-w>h")
keymap.set("", "sk", "<C-w>k")
keymap.set("", "sj", "<C-w>j")
keymap.set("", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<Right>", "<C-w><")
keymap.set("n", "<Left>", "<C-w>>")
keymap.set("n", "<Down>", "<C-w>+")
keymap.set("n", "<Up>", "<C-w>-")

-- better up/down
keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move Lines
keymap.set("n", "<C-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
keymap.set("n", "<C-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
keymap.set("i", "<C-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
keymap.set("i", "<C-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
keymap.set("v", "<C-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
keymap.set("v", "<C-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- Clear search with <esc>
keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- save file
keymap.set({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- better indenting
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")
