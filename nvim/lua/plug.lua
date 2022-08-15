local status, packer = pcall(require, "packer")

if (not status) then
    print('Packer is not installed')
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
            install_path })
    end
    print('Packer is installed')
    return
end

vim.cmd [[ packadd packer.nvim ]]

packer.startup(
    function(use)
        use 'wbthomason/packer.nvim' -- Plugin packer
        use 'navarasu/onedark.nvim' -- Theme
        use 'kyazdani42/nvim-web-devicons' -- File icons
        use 'glepnir/lspsaga.nvim' -- LSP UIs
        use 'L3MON4D3/LuaSnip' -- snippets
        use 'hoob3rt/lualine.nvim' -- Statusline
        use 'onsails/lspkind-nvim' -- vscode-like pictograms
        use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
        use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
        use 'hrsh7th/nvim-cmp' -- Completion
        use 'neovim/nvim-lspconfig' -- LSP
        use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
        use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
        use 'MunifTanjim/prettier.nvim' -- Prettier plugin for Neovim's built-in LSP client
        use 'williamboman/mason.nvim'
        use 'williamboman/mason-lspconfig.nvim'
        use 'windwp/nvim-autopairs'
        use 'windwp/nvim-ts-autotag'
        use 'nvim-lua/plenary.nvim' -- Common utilities
        use 'nvim-telescope/telescope.nvim'
        use 'nvim-telescope/telescope-file-browser.nvim'
        use 'akinsho/nvim-bufferline.lua'
        use 'norcalli/nvim-colorizer.lua'
        use 'lewis6991/gitsigns.nvim'
        use 'dinhhuy258/git.nvim' -- For git blame & browse
        use { 'akinsho/toggleterm.nvim', tag = 'v2.*', config = function() require('toggleterm').setup() end } -- Terminal integrated in neovim
        use 'lukas-reineke/indent-blankline.nvim'
        use 'folke/trouble.nvim'
        use 'editorconfig/editorconfig-vim'
        use 'sindrets/diffview.nvim' -- view change for git
        use 'terrortylor/nvim-comment' -- Comment
        use 'qbbr/vim-symfony' -- Integating with symfony
    end
)
