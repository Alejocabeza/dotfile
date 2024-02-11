return {
	"ThePrimeagen/harpoon",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-lua/popup.nvim",
	},
	keys = {
		{
			"<leader>ss",
			function()
				require("harpoon.ui").toggle_quick_menu()
			end,
			desc = "Harpoon Menu",
		},
		{
			"<leader>sa",
			function()
				require("harpoon.mark").add_file()
			end,
			desc = "Harpoon Add file",
		},
	},
	opts = {
		global_settings = {
			enter_on_sendcmd = true,
		},
		projects = {
			["$HOME/code/svelte/snippets"] = {
				term = {
					cmds = {
						"npm run dev",
					},
				},
			},
		},
	},
	config = function(_, opts)
		require("harpoon").setup(opts)
	end,
}
