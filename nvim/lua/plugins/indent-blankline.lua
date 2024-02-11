return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufReadPost", "BufNewFile" },
	enabled = false,
	version = "2.1.0",
	opts = {
		char = "│",
		filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy" },
		show_trailing_blankline_indent = true,
		show_current_context = true,
	},
}
