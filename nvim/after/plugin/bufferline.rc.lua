local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

bufferline.setup({
    options = {
        mode = "tabs",
        always_show_bufferline = true,
        show_buffer_close_icons = true,
        show_close_icon = false,
        color_icons = true
    },
    highlights = {
        separator = {
            fg = '#073642',
            bg = '#073642',
        },
        separator_selected = {
            fg = '#073642',
        },
        background = {
            fg = '#657b83',
        },
        buffer_selected = {
            fg = '#fdf6e3',
        },
        fill = {
            bg = '#073642'
        }
    }
})

vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})
