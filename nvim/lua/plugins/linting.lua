return {
  "mfussenegger/nvim-lint",
  opts = {
    linters_by_ft = {
      fish = { "fish" },
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      svelte = { "eslint_d" },
      html = { "eslint_d" },
      css = { "eslint_d" },
      python = { "pylint" },
    },
  },
}
