return {
	"Exafunction/codeium.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
	},
	opts = {},
	config = function(_, opts)
		require("codeium").setup(opts)
	end,
}
