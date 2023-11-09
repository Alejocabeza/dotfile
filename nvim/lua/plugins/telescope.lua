local Util = require("util")
return {
  "nvim-telescope/telescope.nvim",
  enabled = true,
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-lua/popup.nvim",
    "nvim-telescope/telescope-fzy-native.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      dependencies = {
        "junegunn/fzf.vim",
        dependencies = {
          {
            "tpope/vim-dispatch",
            cmd = { "Make", "Dispatch" },
          },
          {
            "junegunn/fzf",
            build = ":call fzf#install()",
          },
        },
      },
    },
    "nvim-telescope/telescope-file-browser.nvim",
    "nvim-tree/nvim-web-devicons",
    "nvim-telescope/telescope-ui-select.nvim",
  },
  cmd = "Telescope",
  version = false,
  keys = {
    -- {
    --   ";ff",
    --   function()
    --     require("telescope.builtin").find_files({ no_ignore = false, hidden = true })
    --   end,
    --   desc = "Fuzzy find files in cwd",
    -- },
    { ";ff", "<cmd>FZF <cr>", desc = "Fuzzy find files in cwd" },
    { ";fr", "<cmd>Telescope oldfiles<cr>", desc = "Fuzzy find recent files" },
    { ";fs", Util.telescope("live_grep"), desc = "Find string in root" },
    { ";fc", "<cmd>Telescope grep_string<cr>", desc = "Find string under cursor in cwd" },
    { ";fb", "<cmd>Telescope buffers<cr>", desc = "Fuzzy find buffers" },
    { ";ft", "<cmd>Telescope help_tags<cr>", desc = "Fuzzy find help tags" },
    { ";fe", "<cmd>Telescope diagnostics<cr>", desc = "Fuzzy find diagnostics" },
    {
      "sf",
      function()
        require("telescope").extensions.file_browser.file_browser({
          path = "%:p:h",
          cwd = vim.fn.expand("%:p:h"),
          respect_gitignore = false,
          hidden = true,
          grouped = true,
          previewer = true,
          initial_mode = "normal",
          layout_config = { height = 40 },
        })
      end,
    },
  },
  opts = {
    defaults = {
      preview = {
        filetype_hook = filetype_hook,
      },
      prompt_prefix = " ",
      theme = "dropdown",
      selection_caret = " ",
      initial_mode = "normal",
      path_display = { "truncate" },
      mappings = {
        i = {
          ["<C-k>"] = function(...)
            return require("telescope.actions").move_selection_previous
          end, -- move to prev result
          ["<C-j>"] = function(...)
            return require("telescope.actions").move_selection_next
          end, -- move to next result
          ["<C-q>"] = function(...)
            return require("telescope.actions").send_selected_to_qflist + require("telescope.actions").open_qflist
          end,
        },
        n = {
          ["q"] = function(...)
            return require("telescope.actions").close(...)
          end,
        },
      },
    },
    extensions = {
      file_browser = {
        theme = "dropdown",
        hijack_netrw = true,
        mappings = {
          ["i"] = {
            ["<C-w>"] = function(...)
              return vim.cmd("normal vbd")
            end,
          },
          ["n"] = {
            ["N"] = function(...)
              return require("telescope").extensions.file_browser.actions.create(...)
            end,
            ["h"] = function(...)
              return require("telescope").extensions.file_browser.actions.goto_parent_dir(...)
            end,
            ["/"] = function(...)
              return vim.cmd("startinsert")
            end,
            ["<C-u>"] = function(prompt_bufnr)
              for i = 1, 10 do
                require("telescope.actions").move_selection_previous(prompt_bufnr)
              end
            end,
            ["<C-d>"] = function(prompt_bufnr)
              for i = 1, 10 do
                require("telescope.actions").move_selection_next(prompt_bufnr)
              end
            end,
            ["<PageUp>"] = function(...)
              return require("telescope.actions").preview_scrolling_up(...)
            end,
            ["<PageDown>"] = function(...)
              return require("telescope.actions").preview_scrolling_down(...)
            end,
          },
        },
      },
      fzf = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      },
      fzy_native = {
        override_generic_sorter = true,
        override_file_sorter = true,
      },
      fzf_writer = {
        use_highlighter = false,
        minimun_grep_characters = 6,
      },
    },
  },
  config = function(_, opts)
    local telescope = require("telescope")
    telescope.setup(opts)
    telescope.load_extension("fzf")
    -- telescope.load_extension("notify")
    telescope.load_extension("ui-select")
    telescope.load_extension("file_browser")
  end,
}
