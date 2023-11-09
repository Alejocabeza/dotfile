local status, mason = pcall(require, "mason")

if not status then
  return
end

local mason_lspconfig = require("mason-lspconfig")
local mason_tool_installer = require("mason-tool-installer")
local mason_nls = require("mason-null-ls")

mason.setup({
  ui = {
    border = "rounded",
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

mason_lspconfig.setup({
  ensure_installed = {
    "tsserver",
    "html",
    "cssls",
    "tailwindcss",
    "svelte",
    "emmet_ls",
    "jsonls",
    "intelephense",
    "cssmodules_ls",
    "diagnosticls",
    "yamlls",
    "vimls",
    "lua_ls",
    "dockerls",
    "astro",
  },
  automatic_installation = true,
})

mason_tool_installer.setup({
  ensure_installed = {
    "prettier",
    "stylua",
    "eslint_d",
    "phpstan",
    "phpcs",
    "jq",
  },
  automatic_installation = true,
})

mason_nls.setup({
  automatic_installation = true,
  ensure_installed = {
    "pint",
    "lua_ls",
    "php-cs-fixer",
  },
})
