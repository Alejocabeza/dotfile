return {
  "Wansmer/treesj",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  keys = {
    {
      "<leader>j",
      function()
        require("treesj").toggle()
      end,
      desc = "Toggle treesj",
    },
    {
      "<leader>j",
      function()
        require("treesj").toggle({ split = { recursive = true } })
      end,
      desc = "treesj recursively toggle",
    },
  },
  opts = {
    use_default_keymaps = false,
  },
}
