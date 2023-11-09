return {
  "nvim-tree/nvim-tree.lua",
  enabled = true,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    view = {
      width = 40,
      relativenumber = true,
      side = "right",
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
      custom = { ".DS_Store" },
    },
    git = {
      ignore = true,
    },
  },
  config = function(_, opts)
    local nvimtree = require("nvim-tree")
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])
    nvimtree.setup(opts)
  end,
  keys = {
    { "nf", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" } },
    { "nr", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" } },
  },
}
