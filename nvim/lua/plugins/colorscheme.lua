return {
	{
		"wuelnerdotexe/vim-enfocado",
		lazy = false,
		enabled = false,
		priority = 1000,
		init = function()
			vim.g.enfocado_style = "neon"
		end,
		config = function()
			vim.cmd.colorscheme("enfocado")
		end,
	},
	{
		{
			"ellisonleao/gruvbox.nvim",
			priority = 1000,
			opts = { transparent_mode = true },
			config = function(_, opts)
				require("gruvbox").setup(opts)
			end,
			init = function()
				vim.cmd.colorscheme("gruvbox")
			end,
		},
	},
}
