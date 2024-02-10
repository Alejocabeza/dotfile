return {
	"Exafunction/codeium.nvim",
	dependencies = {
		"hrsh7th/nvim-cmp",
	},
	opts = {},
	config = function(_, opts)
		require("codeium").setup(opts)
	end,
}
