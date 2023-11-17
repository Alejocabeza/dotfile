return {
  {
    "craftzdog/solarized-osaka.nvim",
    enabled = true,
    lazy = true,
    priority = 1000,
    opts = {
      transparent = true,
    },
    config = function(_, opts)
      require("solarized-osaka").setup(opts)
      vim.cmd([[colorscheme solarized-osaka]])
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
}
