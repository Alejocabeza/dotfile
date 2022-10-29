local status, packer = pcall(require, 'packer')

local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim/'
if (not status) then
    print('Packer is Installing')
    packer_bootstrap = vim.fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
        install_path })
    print('Packer is Installed')
end

vim.cmd [[packadd packer.nvim]]

packer.startup(
    function(use)
        use 'wbthomason/packer.nvim'
        --[[ use 'morhetz/gruvbox' -- Gruvbox Theme ]]
        use 'Mofiqul/dracula.nvim' -- Dracula Theme
        --[[ use 'navarasu/onedark.nvim' ]]
        use 'hoob3rt/lualine.nvim' -- StatusLine
        use 'neovim/nvim-lspconfig' -- LSP
        use 'onsails/lspkind-nvim' -- vscode-like pictograms
        use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
        use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
        use 'hrsh7th/nvim-cmp' -- Completion
        use 'L3MON4D3/LuaSnip' -- Snips
        use { 'nvim-treesitter/nvim-treesitter', opts = ':TSUpdate' }
        use 'windwp/nvim-autopairs'
        use 'windwp/nvim-ts-autotag'
        use 'nvim-lua/plenary.nvim' -- Common utilities
        use 'nvim-telescope/telescope.nvim'
        use 'nvim-telescope/telescope-file-browser.nvim'
        use 'kyazdani42/nvim-web-devicons' -- File icons
        use 'akinsho/nvim-bufferline.lua'
        use 'glepnir/lspsaga.nvim' -- LSP UIs
        use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
        use 'MunifTanjim/prettier.nvim' -- Prettier plugin for Neovim's built-in LSP client
        use 'lewis6991/gitsigns.nvim'
        use 'dinhhuy258/git.nvim' -- For git blame & browse
        use 'williamboman/mason.nvim'
        use 'williamboman/mason-lspconfig.nvim'
        use 'sindrets/diffview.nvim'
        use 'qbbr/vim-symfony'
        use 'gpanders/editorconfig.nvim'
        use { 'mg979/vim-visual-multi', branch = 'master' }
        use 'numToStr/Comment.nvim'
        use 'p00f/nvim-ts-rainbow' -- Color of pairs
        use 'nvim-treesitter/nvim-tree-docs'
        use 'lukas-reineke/indent-blankline.nvim'
        use 'MunifTanjim/eslint.nvim'
        use 'szw/vim-maximizer'
        use 'jayp0521/mason-null-ls.nvim'
    end
)
