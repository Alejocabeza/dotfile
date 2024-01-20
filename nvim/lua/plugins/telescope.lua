return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {"nvim-telescope/telescope-fzf-native.nvim", build='make'},
        'nvim-tree/nvim-web-devicons'
    },
    keys = {
        {
            ';f',
            '<cmd>Telescope find_files<cr>',
            {desc = 'Fuzzy find files in cwd'}
        },
        {
            ";b",
            function ()
                local builtin = require('telescope.builtin')
                builtin.buffers()
            end,
            desc = 'Lists open buffers'
        },
        {
            ";e",
            function()
                local builtin = require("telescope.builtin")
                builtin.diagnostics()
            end,
            desc = "Lists Diagnostics for all open buffers or a specific buffer",
        },
        {
            "<leader>gc",
            "<cmd>Telescope git_commits<cr>",
            desc = "Commits"
        },
        {
            "<leader>gs",
            "<cmd>Telescope git_status<cr>",
            desc = "Status"
        }
    },
    opts = function()
        local telescope = require('telescope')
        local actions = require('telescope.actions')
        return {
            defaults = {
                path_display = {'truncate'},
                mappings = {
                    i = {
                        ['<c-k>']=actions.move_selection_previous,
                        ['<c-j>']=actions.move_selection_next,
                    },
                    n = {
                        ['q'] = actions.close
                    }
                }
            }
        }
    end,
    config = function(_, opts)
        local telescope = require('telescope')
        telescope.setup(opts)
        telescope.load_extension('fzf')
    end
}
