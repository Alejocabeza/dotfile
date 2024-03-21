return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true },
		"nvim-telescope/telescope-ui-select.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		"olacin/telescope-cc.nvim",
	},
	keys = {
		{
			"<leader><space>",
			function()
				require("telescope.builtin").find_files({
					no_ignore = false,
					hidden = true,
				})
			end,
			{ desc = "Fuzzy find files in cwd" },
		},
		{
			"<leader>cc",
			"<cmd>Telescope conventional_commits<cr>",
			{ desc = "Conventional Commits" },
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
		{
			"sf",
			function()
				local telescope = require("telescope")

				local function telescope_buffer_dir()
					return vim.fn.expand("%:p:h")
				end

				telescope.extensions.file_browser.file_browser({
					path = "%:p:h",
					cwd = telescope_buffer_dir(),
					respect_gitignore = false,
					hidden = true,
					grouped = true,
					previewer = false,
					initial_mode = "normal",
					layout_config = { height = 40 },
				})
			end,
			desc = "Open File Browser with the path of the current buffer",
		},
	},
	opts = function()
		local actions = require("telescope.actions")
		local icons = require("config.icons")
		local fb_actions = require("telescope").extensions.file_browser.actions

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
				conventional_commits = {
					theme = "dropdown", -- custom theme
					action = function(entry)
						vim.print(entry)
					end,
					include_body_and_footer = true, -- Add prompts for commit body and footer
				},
				file_browser = {
					theme = "dropdown",
					-- disables netrw and use telescope-file-browser in its place
					hijack_netrw = true,
					mappings = {
						-- your custom insert mode mappings
						["n"] = {
							-- your custom normal mode mappings
							["a"] = fb_actions.create,
							["h"] = fb_actions.goto_parent_dir,
							["/"] = function()
								vim.cmd("startinsert")
							end,
							["<C-u>"] = function(prompt_bufnr)
								for i = 1, 10 do
									actions.move_selection_previous(prompt_bufnr)
								end
							end,
							["<C-d>"] = function(prompt_bufnr)
								for i = 1, 10 do
									actions.move_selection_next(prompt_bufnr)
								end
							end,
							["<PageUp>"] = actions.preview_scrolling_up,
							["<PageDown>"] = actions.preview_scrolling_down,
						},
					},
				},
			},
		}
	end,
	config = function(_, opts)
		local telescope = require("telescope")
		telescope.setup(opts)
		telescope.load_extension("fzf")
		telescope.load_extension("ui-select")
		telescope.load_extension("refactoring")
		telescope.load_extension("file_browser")
		telescope.load_extension("conventional_commits")
	end,
}
