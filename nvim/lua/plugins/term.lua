return {
  "akinsho/toggleterm.nvim",
  enabled = true,
  version = "*",
  opts = {
    size = function(term)
      if term.direction == "horizontal" then
        return 15
      elseif term.direction == "vertical" then
        return vim.o.columns * 0.4
      end
    end,
    open_mapping = [[<C-t>]],
    direction = "horizontal",
  },
  config = function(_, opts)
    require("toggleterm").setup(opts)
  end,
  keys = {
    { "<C-t>", "<cmd>ToggleTerm<cr>", desc = "Open Terminal Integrate" },
  },
}
