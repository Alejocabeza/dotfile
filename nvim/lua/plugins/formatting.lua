return {
  "stevearc/conform.nvim",
  opts = function()
    return {
      formatters_by_ft = {
        javascript = { {"eslint_d", "prettier"} },
        typescript = { {"eslint_d", "prettier"} },
        javascriptreact = { {"eslint_d", "prettier"} },
        typescriptreact = { {"eslint_d", "prettier"} },
        svelte = { {"eslint_d", "prettier"} },
        css = { {"eslint_d", "prettier"} },
        html = { {"eslint_d", "prettier"} },
        json = { {"eslint_d", "prettier"} },
        markdown = { {"eslint_d", "prettier"} },
        python = { {"isort", "black"} },
        lua = { "stylua" },
        fish = { "fish_indent" },
        sh = { "shfmt" },
      },
    }
  end,
}
