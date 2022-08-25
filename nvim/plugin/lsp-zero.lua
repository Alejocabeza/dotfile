local status, lsp_zero = pcall(require, 'lsp-zero')

if(not status) then return end

lsp_zero.preset('recommended')
lsp_zero.setup()
