require("config.settings")
require("config.highlights")
vim.api.nvim_create_autocmd("User", {
	group = vim.api.nvim_create_augroup("LazyVim", { clear = true }),
	pattern = "VeryLazy",
	callback = function()
		require("config.autocmds")
		require("config.maps")
	end,
})
require("config.lazy")
