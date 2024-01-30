return {
  "stevearc/conform.nvim",
  opts = function()
    return {
      formatters_by_ft = {
        javascript = { { "eslint_d", "prettier" } },
        typescript = { { "eslint_d", "prettier" } },
        javascriptreact = { "eslint_d" },
        typescriptreact = { "eslint_d" },
        svelte = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        markdown = { "prettier" },
        python = { "isort" },
        lua = { "stylua" },
        fish = { "fish_indent" },
        sh = { "shfmt" },
      },
    }
  end,
}
