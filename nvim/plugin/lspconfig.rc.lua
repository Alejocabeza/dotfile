local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end

local protocol = require('vim.lsp.protocol')

local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- Enable Completion
    buf_set_option('omnifunc', 'v:lua.vim..lsp.omnifunc')

    -- Mappings
    local opts = { noremap = true, silent = true }
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)

    if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_command [[ augroup Format ]]
        vim.api.nvim_command [[ autocmd! * <buffer> ]]
        vim.api.nvim_command [[ autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync() ]]
        vim.api.nvim_command [[ augroup END ]]
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("Format", { clear = true }),
            buffer = bufnr,
            callback = function() vim.lsp.buf.formatting_seq_sync() end
        })
    end

end

protocol.CompletionItemKind = {
    '', -- Text
    '', -- Method
    '', -- Function
    '', -- Constructor
    '', -- Field
    '', -- Variable
    '', -- Class
    'ﰮ', -- Interface
    '', -- Module
    '', -- Property
    '', -- Unit
    '', -- Value
    '', -- Enum
    '', -- Keyword
    '', -- Snippet
    '', -- Color
    '', -- File
    '', -- Reference
    '', -- Folder
    '', -- EnumMember
    '', -- Constant
    '', -- Struct
    '', -- Event
    'ﬦ', -- Operator
    '', -- TypeParameter
}

local capabilities = require('cmp_nvim_lsp').update_capabilities(
    vim.lsp.protocol.make_client_capabilities()
)

nvim_lsp.flow.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

nvim_lsp.tsserver.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { 'javascript', 'javascriptreact', 'javascript.jsx', 'typescript', 'typescriptreact', 'typescript.tsx' },
    cmd = { "typescript-language-server", "--stdio" },
}

nvim_lsp.sumneko_lua.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false
            },
        },
    },
}


nvim_lsp.intelephense.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { 'php' },
}

nvim_lsp.dockerls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { 'dockerfile' },
}

nvim_lsp.vimls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { 'vim' },
}

nvim_lsp.yamlls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { 'yaml', 'yaml.docker-compose', 'yml' },
}

nvim_lsp.sqls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "sql", "mysql" },
}

nvim_lsp.diagnosticls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    update_in_insert = false,
    virtual_text = { spacing = 4, prefix = "●" },
    severity_sort = true,
}
)

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
    virtual_text = {
        prefix = '●'
    },
    update_in_insert = true,
    float = {
        source = "always", -- Or "if_many"
    },
})
