return {
  {
    "ellisonleao/gruvbox.nvim",
    enabled = false,
    property = 1000,
    opts = {
      transparent_mode = true,
    },
    config = function(_, opts)
      local gruvbox = require("gruvbox")
      gruvbox.setup(opts)
      vim.cmd([[colorscheme gruvbox]])
    end,
  },
  {
    "bluz71/vim-nightfly-guicolors",
    priority = 1000, -- make sure to load this before all the other start plugins
    enabled = false,
    config = function()
      vim.cmd([[colorscheme nightfly]])
    end,
  },
  {
    "folke/tokyonight.nvim",
    enabled = true,
    lazy = false,
    priority = 1000,
    opts = {
      style = "storm",
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
}
