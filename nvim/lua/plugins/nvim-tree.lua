return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	enabled = false,
	keys = {
		{ "<leader><tab>", ":NvimTreeToggle left<CR>", silent = true, desc = "Left File Explorer" },
	},
	opts = {
		on_attach = function(bufnr)
			local api = require("nvim-tree.api")
			local function opts(desc)
				return {
					desc = "nvim-tree: " .. desc,
					buffer = bufnr,
					noremap = true,
					silent = true,
					nowait = true,
				}
			end
			api.config.mappings.default_on_attach(bufnr)
			vim.keymap.set("n", "t", api.node.open.tab, opts("tab"))
		end,
		actions = {
			open_file = {
				quit_on_open = true,
			},
		},
		sort = {
			sorter = "case_sensitive",
		},
		view = {
			width = 30,
			relativenumber = true,
		},
		renderer = {
			group_empty = true,
		},
		filters = {
			dotfiles = true,
			custom = {
				"node_modules/*",
				"dist",
				".next",
				".docusaurus",
				"var",
				"vendor",
			},
		},
		log = {
			enable = true,
			truncate = true,
			types = {
				diagnostics = true,
				git = true,
				profile = true,
				watcher = true,
			},
		},
	},
	config = function(_, opts)
		require("nvim-tree").setup(opts)
		if vim.fn.argc(-1) == 0 then
			vim.cmd("NvimTreeFocus")
		end
	end,
	init = function()
		if vim.fn.argc(-1) == 1 then
			local stat = vim.loop.fs_stat(vim.fn.argv(0))
			if stat and stat.type == "directory" then
				require("nvim-tree")
			end
		end
	end,
}
