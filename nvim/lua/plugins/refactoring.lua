return {
	"ThePrimeagen/refactoring.nvim",
	dependencies = {
		{ "nvim-treesitter/nvim-treesitter" },
	},
	config = function()
		require("refactoring").setup({})
	end,
}
