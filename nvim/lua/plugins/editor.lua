return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		opts = {
			filesystem = {
				filtered_items = {
					visible = true,
					hide_dotfile = true,
					hide_gitignored = true,
					hide_hidden = true,
					never_show = {
						".git",
						"node_modules",
						"var",
						"vendor",
						"dist",
						"bundle",
					},
				},
			},
			window = {
				position = "right",
				mapping_options = {
					noremap = true,
					nowait = true,
				},
				mappings = {
					["<space>"] = {
						"toggle_node",
						nowait = false,
					},
					["<cr>"] = "open",
					["<esc>"] = "cancel",
					["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
				},
			},
		},
		keys = {
			{
				"nt",
				function()
					require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
				end,
				desc = "Explorer NeoTree (root dir)",
			},
		},
		enabled = false,
	},
	{
		enabled = false,
		"folke/flash.nvim",
		---@type Flash.Config
		opts = {
			search = {
				forward = true,
				multi_window = false,
				wrap = false,
				incremental = true,
			},
		},
	},
	{
		"echasnovski/mini.hipatterns",
		event = "BufReadPre",
		opts = {
			highlighters = {
				hsl_color = {
					pattern = "hsl%(%d+,? %d+,? %d+%)",
					group = function(_, match)
						local utils = require("alejocabeza.utils")
						local h, s, l = match:match("hsl%((%d+),? (%d+),? (%d+)%)")
						h, s, l = tonumber(h), tonumber(s), tonumber(l)
						local hex_color = utils.hslToHex(h, s, l)
						return MiniHipatterns.compute_hex_color_group(hex_color, "bg")
					end,
				},
			},
		},
	},

	{
		"dinhhuy258/git.nvim",
		event = "BufReadPre",
		opts = {
			keymaps = {
				-- Open blame window
				blame = "<Leader>gb",
				-- Open file/folder in git repository
				browse = "<Leader>go",
			},
		},
	},

	{
		"telescope.nvim",
		keys = {
			-- {
			-- 	"sf",
			-- 	function()
			-- 		local telescope = require("telescope")
			--
			-- 		local function telescope_buffer_dir()
			-- 			return vim.fn.expand("%:p:h")
			-- 		end
			--
			-- 		telescope.extensions.file_browser.file_browser({
			-- 			path = "%:p:h",
			-- 			cwd = telescope_buffer_dir(),
			-- 			respect_gitignore = false,
			-- 			hidden = true,
			-- 			grouped = true,
			-- 			previewer = false,
			-- 			initial_mode = "normal",
			-- 			layout_config = { height = 40 },
			-- 		})
			-- 	end,
			-- 	desc = "Open File Browser with the path of the current buffer",
			-- },
		},
		config = function(_, opts)
			local telescope = require("telescope")
			local actions = require("telescope.actions")

			opts.defaults = vim.tbl_deep_extend("force", opts.defaults, {
				wrap_results = true,
				layout_strategy = "horizontal",
				layout_config = { prompt_position = "top" },
				sorting_strategy = "ascending",
				winblend = 0,
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
					},
				},
			})
			opts.pickers = {
				diagnostics = {
					theme = "ivy",
					initial_mode = "normal",
					layout_config = {
						preview_cutoff = 9999,
					},
				},
			}
			telescope.setup(opts)
		end,
	},
}
