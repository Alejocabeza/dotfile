return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true },
		"nvim-tree/nvim-web-devicons",
		"nvim-telescope/telescope-ui-select.nvim",
		"nvim-telescope/telescope-frecency.nvim",
	},
	keys = {
		{
			"<leader>ff",
			"<cmd>Telescope find_files<cr>",
			{ desc = "Fuzzy find files in cwd" },
		},
		{
			"<leader>fb",
			function()
				local builtin = require("telescope.builtin")
				builtin.buffers()
			end,
			desc = "Lists open buffers",
		},
		{
			"<leader>fc",
			function()
				local builtin = require("telescope.builtin")
				builtin.diagnostics()
			end,
			desc = "Lists Diagnostics for all open buffers or a specific buffer",
		},
		{
			"<leader>gc",
			"<cmd>Telescope git_commits<cr>",
			desc = "Commits",
		},
		{
			"<leader>gs",
			"<cmd>Telescope git_status<cr>",
			desc = "Status",
		},
	},
	opts = function()
		local actions = require("telescope.actions")
		local icons = require("config.icons")

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "TelescopeResults",
			callback = function(ctx)
				vim.api.nvim_buf_call(ctx.buf, function()
					vim.fn.matchadd("TelescopeParent", "\t\t.*$")
					vim.api.nvim_set_h1(0, "TelescopeParent", { link = "Comment" })
				end)
			end,
		})

		local function formattedName(_, path)
			local tail = vim.fs.basename(path)
			local parent = vim.fs.dirname(path)
			if parent == "." then
				return tail
			end
			return string.format("%s\t\t%s", tail, parent)
		end

		return {
			file_ignore_patterns = { "%.git/." },
			defaults = {
				path_display = { "truncate" },
				mappings = {
					i = {
						["<c-k>"] = actions.move_selection_previous,
						["<c-j>"] = actions.move_selection_next,
					},
					n = {
						["q"] = actions.close,
					},
				},
				preview = false,
				prompt_prefix = " " .. icons.ui.Telescope .. " ",
				selection_caret = icons.ui.BoldArrowRight .. " ",
				file_ignore_patters = { "node_module", "package-log.json", "vender", "var", "dist", "build" },
				initial_mode = "insert",
				select_strategy = "reset",
				sorting_strategy = "ascending",
				color_devicons = true,
				set_env = { ["COLORTERM"] = "truecolor" },
				layout_config = {
					prompt_position = "top",
					preview_cutoff = 120,
				},
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
					"--hidden",
					"--glob=!.git/",
				},
			},
			pickers = {
				find_files = {
					preview = false,
					path_display = formattedName,
					layout_config = {
						height = 0.4,
						prompt_position = "top",
						preview_cutoff = 120,
					},
				},
				git_files = {
					previewr = false,
					path_display = formattedName,
					layout_config = {
						height = 0.4,
						prompt_position = "top",
						preview_cutoff = 120,
					},
				},
				buffer = {
					path_display = formattedName,
					mappings = {
						i = {
							["<c-d>"] = actions.delete_buffer,
						},
						n = {
							["<c-d>"] = actions.delete_buffer,
						},
					},
					preview = false,
					initial_mode = "normal",
					layout_config = {
						height = 0.4,
						width = 0.6,
						prompt_position = "top",
						preview_cutoff = 120,
					},
				},
				current_buffer_fuzzy_find = {
					previewer = true,
					layout_config = {
						prompt_position = "top",
						preview_cutoff = 120,
					},
				},
				live_grep = {
					only_sort_text = true,
					previewer = true,
				},
				grep_string = {
					only_sort_text = true,
					previewer = true,
				},
				lsp_references = {
					show_line = false,
					previewer = true,
				},
				treesitter = {
					show_line = false,
					previewer = true,
				},
				colorscheme = {
					enable_preview = true,
				},
			},
			extensions = {
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case"
				},
				["ui-select"] = {
					require("telescope.themes").get_dropdown({
						previewer = false,
						initial_mode = "normal",
						sorting_strategy = "ascending",
						layout_strategy = "horizontal",
						layout_config = {
							horizontal = {
								width = 0.5,
								height = 0.4,
								preview_width = 0.6,
							},
						},
					}),
				},
				frecency = {
					default_workspace = "CWD",
					show_scores = true,
					show_unindexed = true,
					disable_devicons = false,
					ignore_patterns = {
						"*.git/*",
						"*/tmp/*",
						"*/lua-language-server/*",
					},
				},
			},
		}
	end,
	config = function(_, opts)
		local telescope = require("telescope")
		telescope.setup(opts)
		-- telescope.load_extension("fzf")
		telescope.load_extension("ui-select")
		telescope.load_extension("refactoring")
		telescope.load_extension("frecency")
	end,
}
