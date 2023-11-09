return {
  "williamboman/mason.nvim",
  enabled = true,
  cmd = "Mason",
  keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
  build = ":MasonUpdate",
  config = function()
    require("after.mason")
  end,
}
