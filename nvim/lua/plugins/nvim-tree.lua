return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {'nvim-tree/nvim-web-devicons'},
    opts = {
        view = {
            width = 35,
            relativenumber = false,
        },
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
                quit_on_open = true,
                window_picker = {
                    enable = false,
                },
            },
        },
        filters = {
            custom = {'.DS_Store', '.vscode'}
        },
        git = {
            ignore = false,
        }
    },
    config = function(_, opts)
        require('nvim-tree').setup(opts)
    end,
    keys = {
        {'nt', '<cmd>NvimTreeFindFileToggle<cr>', {desc = 'Toggle file explorer on current file'}}
    }
}
