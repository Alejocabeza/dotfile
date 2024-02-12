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
		enabled = true,
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
}
