return {
  "jose-elias-alvarez/null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  enabled = true,
  dependencies = { "mason.nvim" },
  config = function()
    require("after.null-ls")
  end,
}
