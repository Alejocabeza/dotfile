local status, lsp = pcall(require, "lspconfig")
if not status then
  return
end

local protocol = require("vim.lsp.protocol")

local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })
local enable_format_on_save = function(_, bufnr)
  vim.api.nvim_clear_autocmds({ group = augroup_format, buffer = bufnr })
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = augroup_format,
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.format({ bufnr = bufnr })
    end,
  })
end

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  -- mappings
  local opts = { noremap = true, silent = true }
  buf_set_keymap("n", "gdl", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
  buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)

  enable_format_on_save(client, bufnr)
end

protocol.CompletionItemKind = {
  "", -- Text
  "", -- Method
  "", -- Function
  "", -- Constructor
  "", -- Field
  "", -- Variable
  "", -- Class
  "ﰮ", -- Interface
  "", -- Module
  "", -- Property
  "", -- Unit
  "", -- Value
  "", -- Enum
  "", -- Keyword
  "﬌", -- Snippet
  "", -- Color
  "", -- File
  "", -- Reference
  "", -- Folder
  "", -- EnumMember
  "", -- Constant
  "", -- Struct
  "", -- Event
  "ﬦ", -- Operator
  "", -- TypeParameter
}

local capabilities = require("cmp_nvim_lsp").default_capabilities()

lsp.flow.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lsp.tsserver.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lsp.diagnosticls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lsp.tailwindcss.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lsp.dockerls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lsp.unocss.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lsp.yamlls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lsp.vimls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lsp.jsonls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lsp.emmet_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lsp.cssmodules_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lsp.intelephense.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lsp.cssls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lsp.svelte.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lsp.astro.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  update_in_insert = false,
  virtual_text = { spacing = 4, prefix = "\u{ea71}" },
  severity_sort = true,
})

lsp.lua_ls.setup({
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    enable_format_on_save(client, bufnr)
  end,
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
      },

      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
    },
  },
})

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
  virtual_text = {
    prefix = "●",
  },
  update_in_insert = true,
  float = {
    source = "always", -- Or "if_many"
  },
})
