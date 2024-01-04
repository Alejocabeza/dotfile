return {
	"axelvc/template-string.nvim",
	event = "LazyFile",
	config = function(_, opts)
		require("template-string").setup(opts)
	end,
	opts = {
		filetypes = { "html", "typescript", "javascript", "typescriptreact", "vue", "svelte", "astro", "python" },
		jsx_brackets = true,
		remove_template_string = true,
		restore_quotes = {
			normal = [[']],
			jsx = [["]],
		},
	},
}
