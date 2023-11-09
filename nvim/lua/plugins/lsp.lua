return {
  "neovim/nvim-lspconfig",
  enabled = true,
  dependencies = {
    "jose-elias-alvarez/null-ls.nvim",
    {
      "williamboman/mason.nvim",
      opts = {
        ui = {
          border = "rounded",
        },
      },
    },
    {
      "hrsh7th/cmp-nvim-lsp",
      cond = function()
        return require("util").has("nvim-cmp")
      end,
    },
    "folke/neodev.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    {
      "jay-babu/mason-null-ls.nvim",
      event = { "BufReadPre", "BufNewFile" },
      dependencies = {
        "williamboman/mason.nvim",
        "jose-elias-alvarez/null-ls.nvim",
      },
    },
  },
  event = "VeryLazy",
  config = function()
    require("after.lsp")
  end,
}
