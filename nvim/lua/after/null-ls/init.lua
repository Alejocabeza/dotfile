local status, null_ls = pcall(require, "null-ls")
if not status then
  return
end

local augroup = vim.api.nvim_create_augroup("LspFormating", {})
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    filter = function(client)
      return client.name == "null-ls"
    end,
    bufnr = bufnr,
  })
end

null_ls.setup({
  sources = {
    -- Formatting
    formatting.jq,
    formatting.prettier.with({
      method = null_ls.methods.FORMATTING,
      condition = function(utils)
        return utils.root_has_file({ ".prettierc", "prettier.config.js", "prettier.config.mjs", "package.json" })
      end,
      extra_filetypes = { "astro" },
    }),
    formatting.eslint_d.with({
      method = null_ls.methods.FORMATTING,
      condition = function(utils)
        return utils.root_has_file({ ".eslintrc.js", ".eslintrc", ".eslintrc.yaml", ".eslintrc.json", "package.json" })
      end,
    }),
    formatting.stylua,
    -- formatting.pint,
    -- formatting.phpcsfixer,
    -- Diagnostic
    -- diagnostics.luacheck,
    diagnostics.eslint_d.with({
      method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
      condition = function(utils)
        return utils.root_has_file({ ".eslintrc.js", ".eslintrc", ".eslintrc.yaml", ".eslintrc.json", "package.json" })
      end,
    }),
    diagnostics.php.with({}),
    diagnostics.phpcs.with({
      method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
      condition = function(utils)
        return utils.root_has_file("php.xml")
      end,
    }),
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          lsp_formatting(bufnr)
        end,
      })
    end
  end,
})

vim.api.nvim_create_user_command("DisableLspFormatting", function()
  vim.api.nvim_clear_autocmds({ group = augroup, buffer = 0 })
end, { nargs = 0 })
