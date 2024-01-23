return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "meuter/lualine-so-fancy.nvim" },
	init = function()
		vim.g.lualine_laststatus = vim.o.laststatus
		if vim.fn.argc(-1) > 0 then
			vim.o.statusline = " "
		else
			vim.o.laststatus = 0
		end
	end,
	opts = function()
		local icons = require("config.icons")
		local lualine_require = require("lualine_require")
		lualine_require.require = require

		vim.o.laststatus = vim.g.lualine_laststatus

		return {
			options = {
				theme = "auto",
				globalstatus = true,
				icons_enabled = true,
				component_separators = { left = icons.ui.DividerRight, right = icons.ui.DividerLeft },
				section_separators = { left = "", right = "" },
				refresh = { statusline = 100 },
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
				lualine_a = { "fancy_mode" },
				lualine_b = { "fancy_branch" },
				lualine_c = {
					{
						"filename",
						path = 1,
						symbols = {
							modified = "",
						},
					},
					{ "fancy_searchcount" },
				},
				lualine_x = {
					{
						"fancy_diagnostics",
						sources = { "nvim_lsp" },
						symbols = { error = " ", warn = " ", info = " " },
					},
				},
				lualine_y = { { "fancy_filetype", ts_icon = "" } },
				lualine_z = { { "fancy_cwd", substitute_home = true } },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_z = {},
				lualine_y = {},
			},
			tabline = {},
			extensions = { "neo-tree", "lazy", "nvim-tree" },
		}
	end,
	config = function(_, opts)
		require("lualine").setup(opts)
	end,
}
