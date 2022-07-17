-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(
    function()

        -- Packer can manage itself
        use 'wbthomason/packer.nvim'

        -- colorschemes
        use 'navarasu/onedark.nvim'

        -- file explorer
        use {
            'nvim-neo-tree/neo-tree.nvim',
            branch = "v2.x",
            requires = {
                "nvim-lua/plenary.nvim",
                "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
                "MunifTanjim/nui.nvim"
            },
        }

        -- buffers
        -- use 'ap/vim-buftabline'
        use {
          'romgrk/barbar.nvim',
          requires = {'kyazdani42/nvim-web-devicons'}
        }

        -- git
        use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
        use 'kdheepak/lazygit.nvim'

        -- autopairs
        use 'cohama/lexima.vim'

        -- syntax
        use 'sheerun/vim-polyglot'
        use 'nanotee/sqls.nvim'

        -- suports for editorconfig
        use 'editorconfig/editorconfig-vim'

        -- indent line
        use 'lukas-reineke/indent-blankline.nvim'

        -- LSP
        use 'neovim/nvim-lspconfig'

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

        -- treesitter interface
        use 'nvim-treesitter/nvim-treesitter'
        use 'nvim-treesitter/nvim-tree-docs'
        use 'p00f/nvim-ts-rainbow'

        -- EasyMotion
        use 'easymotion/vim-easymotion'

        -- tmux navigation
        use 'christoomey/vim-tmux-navigator'

        -- Lua Line
        use {
            'nvim-lualine/lualine.nvim',
            requires = { 'kyazdani42/nvim-web-devicons', opt = true }
        }

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
        -- use 'm2mdas/phpcomplete-extended'
        use 'docteurklein/vim-symfony'

        -- terminal
        use {"akinsho/toggleterm.nvim", tag = 'v2.*', config = function()
          require("toggleterm").setup()
        end}

    end
)
