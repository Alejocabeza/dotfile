return {
	"nvim-treesitter/nvim-treesitter-context",
	event = "VeryLazy",
	enabled = true,
	opts = { mode = "cursor", max_lines = 3 },
	config = function(_, opts)
		require("treesitter-context").setup(opts)
	end,
}
