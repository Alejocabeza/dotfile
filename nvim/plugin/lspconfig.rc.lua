local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end

local protocol = require('vim.lsp.protocol')

local on_attach = function(client, bufnr)
    -- formatting
    if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_command [[augroup Format]]
        vim.api.nvim_command [[autocmd! * <buffer>]]
        vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
        vim.api.nvim_command [[augroup END]]
    end
end

nvim_lsp.flow.setup {
    on_attach = on_attach
}

nvim_lsp.tsserver.setup {
    on_attach = on_attach,
    filetypes = { 'javascript', 'javascriptreact', 'javascript.jsx', 'typescriptreact', 'typescript', 'typescript.jsx' },
    cmd = { 'typescript-language-server', '--stdio' }
}

nvim_lsp.intelephense.setup {
    on_attach = on_attach,
    filetypes = { 'php' }
}

nvim_lsp.vimls.setup {
    on_attach = on_attach,
    filetypes = { 'vim' }
}

nvim_lsp.yamlls.setup {
    on_attach = on_attach,
    filetypes = { 'yaml', 'yaml.docker-compose', 'yml' }
}

nvim_lsp.diagnosticls.setup {
    on_attach = on_attach
}

nvim_lsp.sumneko_lua.setup {
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file('', true),
                checkThirdParty = false
            },
        },
    },
}
