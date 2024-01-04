return {
	{
		"craftzdog/solarized-osaka.nvim",
		lazy = true,
		enabled = true,
		priority = 1000,
		opts = function()
			return {
				transparent = true,
			}
		end,
	},
	{
		enabled = false,
		"folke/tokyonight.nvim",
	},
	{
		"bluz71/vim-nightfly-guicolors",
		enabled = false,
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			vim.cmd([[colorscheme nightfly]])
		end,
	},
	{
		"navarasu/onedark.nvim",
		enabled = false,
		lazy = true,
		priority = 1000,
		opts = {
			transparent = true,
			lualine = {
				transparent = true,
			},
		},
		config = function(_, opts)
			require("onedark").setup(opts)
		end,
	},
}
