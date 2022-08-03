------------------------------------------------------------------------------------
-- Import Lua Modules
------------------------------------------------------------------------------------
require('settings')                                    -- Settings
require('keymaps')                                     -- Keymaps
require('plug')                                        -- Plugin manager
------------------------------------------------------------------------------------
-- Themes
------------------------------------------------------------------------------------
-- require('after/themes/gruvbox')                        -- Gruvbox
require('after/themes/dracula')                        -- Dracula
------------------------------------------------------------------------------------
-- UI and Intergration
------------------------------------------------------------------------------------
require('after/neo-tree')                              -- Filebrowser
require('after/indent-blankline')                      -- Indentation
require('after/lua-line')                              -- Lua Line
require('after/diffview')                              -- diffview
require('after/barbar')                                -- barbar
require('after/lspinstaller')                          -- LspInstaller
------------------------------------------------------------------------------------
-- Completion
------------------------------------------------------------------------------------
require('after/lspconfig')                             -- LSP
require('after/nvim-treesitter')                       -- Treesitter
require('after/completion')                            -- completion
require('after/telescope-nvim')                        -- Telescope
------------------------------------------------------------------------------------
-- Terminal
------------------------------------------------------------------------------------
require('after/toggleterm')                            -- Terminal
