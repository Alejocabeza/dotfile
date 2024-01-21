return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	init = function()
		vim.g.lualine_laststatus = vim.o.laststatus
		if vim.fn.argc(-1) > 0 then
			vim.o.statusline = " "
		else
			vim.o.laststatus = 0
		end
	end,
	opts = function()
		local lazy_status = require("lazy.status")
		return {
			options = {
				theme = "auto",
				globalstatus = true,
				disabled_filetypes = { statusline = {} },
			},
			sections = {
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" },
					},
					{ "encoding" },
					{ "fileformat" },
					{ "filetypes" },
				},
			},
		}
	end,
	config = function(_, opts)
		require("lualine").setup(opts)
	end,
}
