return {
  {
    "craftzdog/solarized-osaka.nvim",
    enabled = false,
    lazy = true,
    priority = 1000,
    opts = function()
      return {
        transparent = true,
      }
    end,
  },
  {
    "bluz71/vim-nightfly-guicolors",
    priority = 1000, -- make sure to load this before all the other start plugins
    enabled = true,
    config = function()
      vim.cmd([[colorscheme nightfly]])
    end,
  },
}
