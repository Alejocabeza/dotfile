return {
	{ "MunifTanjim/nui.nvim", lazy = true },
	{
		"editorconfig/editorconfig-vim",
	},
	{
		"LunarVim/breadcrumbs.nvim",
		config = function()
			require("breadcrumbs").setup()
		end,
	},
	{
		"folke/persistence.nvim",
		event = "BufReadPre", -- this will only start session saving when an actual file was opened
		opts = {},
	},
	{
		"derektata/lorem.nvim",
		config = function()
			local lorem = require("lorem")
			lorem.setup({
				sentenceLength = "mixedShort",
				comma = 1,
			})
		end,
	},
}
