require('config.options')

vim.api.nvim_create_autocmd("User", {
	group = vim.api.nvim_create_augroup("LazyVim", {clear = true}),
	pattern = "VeryLazy",
	callback = function()
		require('config.keymaps')
		require('config.autocmd')
	end,
})

require('config.lazy')
