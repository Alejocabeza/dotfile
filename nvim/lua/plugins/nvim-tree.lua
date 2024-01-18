return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{ "nt", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" } },
	},
	opts = {
		sort_by = "case_sensitive",
		view = {
			width = 35,
			relativenumber = true,
		},
		-- change folder arrow icons
		renderer = {
			indent_markers = {
				enable = true,
			},
			icons = {
				glyphs = {
					folder = {
						arrow_closed = "", -- arrow when folder is closed
						arrow_open = "", -- arrow when folder is open
					},
				},
			},
		},
		actions = {
			open_file = {
				-- quit_on_open = true,
				window_picker = {
					enable = false,
				},
			},
		},
		update_focused_file = {
			enable = true,
			update_cwd = false,
		},
		filters = {
			custom = { ".DS_Store", "^.git$", "node_modules", ".vscode", "var", "vendor", "package-lock.json" },
		},
		git = {
			ignore = false,
		},
	},
	init = function()
		if vim.fn.argc(-1) == 1 then
			local stat = vim.loop.fs_stat(vim.fn.argv(0))
			if stat and stat.type == "directory" then
				require("nvim-tree")
			end
		end
	end,
	config = function(_, opts)
		require("nvim-tree").setup(opts)
	end,
}
