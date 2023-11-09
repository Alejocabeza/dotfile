return {
  "nvimdev/lspsaga.nvim",
  enabled = true,
  opts = {
    ui = {
      border = "rounded",
    },
    symbol_in_wimbar = {
      enable = true,
    },
    lightbulb = {
      enable = true,
    },
    outline = {
      layout = "float",
    },
  },
  keys = {
    { "gl", "<cmd>Lspsaga show_line_diagnostics<cr>" },
    { "K", "<cmd>Lspsaga hover_doc<cr>" },
    { "gd", "<cmd>Lspsaga finder<cr>" },
    { "gt", "<cmd>Lspsaga goto_type_definition<cr>" },
    { "gp", "<cmd>Lspsaga peek_definition<cr>" },
    { "gr", "<cmd>Lspsaga rename<cr>" },
    { "ca", "<cmd>Lspsaga code_actions<cr>", { mode = { "n", "v" } } },
  },
}
