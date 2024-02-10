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
		enabled = true,
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
}
