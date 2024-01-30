return {
  "rmagatti/alternate-toggler",
  opts = {
    alternates = {
      ["==="] = "!==",
      ["=="] = "!=",
      ["error"] = "warn",
      ["true"] = "false",
    },
  },
  config = function(_, opts)
    require("alternate-toggler").setup(opts)
    local keymap = vim.keymap
    keymap.set("n", "<leader>i", "<cmd>ToggleAlternate<cr>")
  end,
}
