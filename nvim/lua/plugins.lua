local status, packer = pcall(require, "packer")

local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim/"
if not status then
	print("Packer is Installing")
	packer_bootstrap = vim.fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		f("https://github.com/wbthomason/packer.nvim"),
		install_path,
	})
	print("Packer is Installed")
end

vim.cmd([[packadd packer.nvim]])

packer.startup(function(use)
	use("wbthomason/packer.nvim") -- Packer
	use("navarasu/onedark.nvim") -- theme
	use("hoob3rt/lualine.nvim") -- StatusLine
	use("akinsho/nvim-bufferline.lua") -- BufferLine
	use("nvim-lua/plenary.nvim") -- Common utilities
	use("szw/vim-maximizer") -- Maximizer panel
	use("lukas-reineke/indent-blankline.nvim") -- Line Indent
	use("kyazdani42/nvim-web-devicons") -- File icons
	use("MunifTanjim/prettier.nvim") -- Prettier plugin for Neovim's built-in LSP client
	use("MunifTanjim/eslint.nvim") -- Eslint plugin for neovim
	use("numToStr/Comment.nvim") -- Comment Plugin for neovim
	use({ "mg979/vim-visual-multi", branch = "master" }) -- Cursor Multi Edit for Neovim
	use("williamboman/mason-lspconfig.nvim") -- Manager of Installing for LSP and Built for neovim
	use("williamboman/mason.nvim") -- Manager of Installing for LSP and Built for neovim
	use("gpanders/editorconfig.nvim") -- Integration of EditorConfig for Neovim
	use("nelsyeung/twig.vim") -- Integration of twig for neovim
	-- LSP
	use("neovim/nvim-lspconfig") -- LSP NATIVE
	use("onsails/lspkind-nvim") -- vscode-like pictograms
	use("glepnir/lspsaga.nvim") -- LSP UIs
	use("folke/lsp-colors.nvim") -- LSP Color
	-- autocomplete
	use("hrsh7th/nvim-cmp") -- Completion
	use("hrsh7th/cmp-buffer") -- nvim-cmp source for buffer words
	use("hrsh7th/cmp-nvim-lsp") -- nvim-cmp source for neovim's built-in LSP
	use("L3MON4D3/LuaSnip") -- Snips
	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", opts = ":TSUpdate" }) -- syntax
	use("nvim-treesitter/nvim-treesitter-context") -- syntax context
	use("nvim-treesitter/nvim-tree-docs") -- syntax docs
	use("windwp/nvim-ts-autotag") -- Completion Of Tags
	use("windwp/nvim-autopairs") -- Completion Of Pairs
	use("p00f/nvim-ts-rainbow") -- Color of pairs
	-- Telescope
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-file-browser.nvim")
	-- Null
	use("jose-elias-alvarez/null-ls.nvim") -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
	use("jayp0521/mason-null-ls.nvim") -- Use Neovim as a Built-in for LSP
	-- Git
	use("lewis6991/gitsigns.nvim")
	use("dinhhuy258/git.nvim") -- For git blame & browse
	use("sindrets/diffview.nvim") -- For show of change that make of code
end)
