return {
  "stevearc/conform.nvim",
  opts = function()
    return {
      formatters_by_ft = {
        javascript = function(bufnr) end,
        typescript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescriptreact = { "eslint_d" },
        svelte = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        python = { "isort", "black" },
        lua = { "stylua" },
        fish = { "fish_indent" },
        sh = { "shfmt" },
      },
    }
  end,
}
