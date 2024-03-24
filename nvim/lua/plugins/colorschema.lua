return {
	{
		"craftzdog/solarized-osaka.nvim",
		lazy = true,
		priority = 1000,
		enabled = false,
		opts = function()
			return {
				transparent = true,
			}
		end,
		init = function()
			vim.cmd.colorscheme("solarized-osaka")
		end,
	},
	{
		"navarasu/onedark.nvim",
		enabled = false,
		opts = {
			style = "deep",
			transparent = true,
		},
		config = function(_, opts)
			require("onedark").setup(opts)
		end,
		init = function()
			require("onedark").load()
		end,
	},
	{
		"sainnhe/sonokai",
		priority = 1000,
		enabled = false,
		config = function()
			vim.g.sonokai_transparent_background = "1"
			vim.g.sonokai_enable_italic = "1"
			vim.g.sonokai_style = "andromeda"
			vim.cmd.colorscheme("sonokai")
		end,
		init = function()
			vim.cmd.colorscheme("sonokai")
		end,
	},
	{
		"folke/tokyonight.nvim",
		enabled = false,
		lazy = false,
		priority = 1000,
		opts = {
			transparent = true,
		},
		init = function()
			vim.cmd.colorscheme("tokyonight")
		end,
	},
	{
		"baliestri/aura-theme",
		enabled = false,
		lazy = false,
		priority = 1000,
		config = function(plugin)
			vim.opt.rtp:append(plugin.dir .. "/packages/neovim")
			vim.cmd([[colorscheme aura-dark]])
		end,
	},
	{
		"bluz71/vim-moonfly-colors",
		enabled = true,
		name = "moonfly",
		lazy = false,
		priority = 1000,
		init = function()
			vim.cmd.colorscheme("moonfly")
		end,
	},
}
