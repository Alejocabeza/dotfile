return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"meuter/lualine-so-fancy.nvim",
	},
	enabled = true,
	lazy = false,
	event = { "BufReadPost", "BufNewFile", "VeryLazy" },
	opts = function()
		local icons = require("config.icons")
		return {
			options = {
				theme = "auto",
				globalstatus = true,
				icons_enabled = true,
				component_separators = { left = icons.ui.DividerRight, right = icons.ui.DividerLeft },
				section_separators = { left = "", right = "" },
				disable_filetypes = {
					statusline = {
						"alpha",
						"help",
						"noe-tree",
						"nvim-tree",
						"Trouble",
						"spectre_panel",
						"toggleterm",
					},
					winbar = {},
				},
			},
			sections = {
				lualine_a = {},
				lualine_b = {
					"fancy_branch",
				},
				lualine_c = {
					{
						"filename",
						path = 1,
						symbols = {
							modified = "",
						},
					},
					{
						"fancy_diagnostics",
						sources = { "nvim_lsp" },
						symbols = { error = " ", warn = " ", info = " " },
					},
					{ "fancy_searchcount" },
				},
				lualine_x = {
					"fancy_lsp_servers",
					"fancy_diff",
					"progerss",
				},
				lualine_y = {},
				lualine_z = {},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			extensions = { "neo-tree", "lazy", "nvim-tree" },
		}
	end,
}
