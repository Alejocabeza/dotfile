local status, packer = pcall(require, "packer")

if (not status) then
    print('Packer is not installed')
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
      packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    end
    print('Packer is installed')
    return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(
    function(use)
        use 'wbthomason/packer.nvim'
        use 'morhetz/gruvbox'
        use 'nvim-lualine/lualine.nvim' -- Statusline
        use 'nvim-lua/plenary.nvim' -- Common utilities
        use 'onsails/lspkind-nvim' -- Vscode-like pictograms
        use 'neovim/nvim-lspconfig' -- LSP
        use 'jose-elias-alvarez/null-ls.nvim' -- use neovim as a language server to inject LSP diagnostics, code actions, and more via lua
        use 'MunifTanjim/prettier.nvim' -- Prettier plugin for Neovim's built-in LSP Client
        use 'williamboman/mason.nvim'
        use 'williamboman/mason-lspconfig.nvim'
        use 'glepnir/lspsaga.nvim' -- LSP UIs
        use 'L3MON4D3/LuaSnip'
         use {
            'folke/trouble.nvim',
            requires = {
                'kyazdani42/nvim-web-devicons',
            }
        }

        -- treesitter interface
        use 'nvim-treesitter/nvim-treesitter'
        use 'nvim-treesitter/nvim-tree-docs'
        use 'p00f/nvim-ts-rainbow'
        use 'nelsyeung/twig.vim'

        -- Completion
	    use({
            "hrsh7th/nvim-cmp",
            requires = {
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
                "hrsh7th/cmp-nvim-lua",
                "hrsh7th/cmp-nvim-lsp",
                "saadparwaiz1/cmp_luasnip",
                "onsails/lspkind-nvim",
                "L3MON4D3/LuaSnip",
                "windwp/nvim-autopairs",
            },
	    })

        use ("tjdevries/colorbuddy.nvim")

        -- indent line
        use 'lukas-reineke/indent-blankline.nvim'

        -- Telescope
        use({
            "nvim-telescope/telescope.nvim",
            requires = {
                { "nvim-lua/plenary.nvim" },
                { "nvim-lua/popup.nvim" },
                { "nvim-telescope/telescope-fzy-native.nvim" },
                { "kyazdani42/nvim-web-devicons" },
                { "nvim-telescope/telescope-file-browser.nvim" },
                { "nvim-telescope/telescope-dap.nvim" },
                { "nvim-telescope/telescope-ui-select.nvim" },
                { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
            },
	    })

        -- Integration with php
        use 'shawncplus/phpcomplete.vim'
        use 'arnaud-lb/vim-php-namespace'
        use 'phpactor/phpactor'
        use 'docteurklein/vim-symfony'

        -- comment code
        use "tpope/vim-commentary"

        -- terminal
        use {
            "akinsho/toggleterm.nvim", tag = 'v2.*', config = function()
                require("toggleterm").setup()
            end
        }

        -- autopairs
        use 'cohama/lexima.vim'

        -- Buffers
        use 'akinsho/nvim-bufferline.lua'

        -- git
        use 'lewis6991/gitsigns.nvim'
        use 'dinhhuy258/git.nvim'

    end
)

