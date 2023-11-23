return {
  {
    "craftzdog/solarized-osaka.nvim",
    branch = "tokyo",
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
}
