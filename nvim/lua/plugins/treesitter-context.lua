return {
	"nvim-treesitter/nvim-treesitter-context",
	event = "VeryLazy",
	enable = true,
	opts = { mode = "cursor", max_lines = 1 },
	config = function(_, opts)
		require("treesitter-context").setup(opts)
	end,
}
