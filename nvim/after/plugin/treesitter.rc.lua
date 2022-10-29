local status, ts = pcall(require, 'nvim-treesitter.configs')
if (not status) then return end

ts.setup {
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'php', 'javascript', 'typescript' },
        disable = {},
    },
    indent = {
        enable = true,
        disable = {},
    },
    ensure_installed = {
        'tsx',
        'php',
        'css',
        'html',
        'lua',
        'phpdoc',
        'jsdoc',
        'bash',
        'yaml',
        'dockerfile',
        'json',
        'scss',
        'javascript',
        'typescript',
        'python',
        'fish'
    },
    autotag = {
        enable = true,
    },
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    },
    tree_docs = {
        enable = true
    }
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
