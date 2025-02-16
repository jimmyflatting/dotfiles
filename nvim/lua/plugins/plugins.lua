return {
    -- the colorscheme should be available when starting Neovim
    {
      "morhetz/gruvbox",
      -- "rose-pine/neovim", 
      -- name = "rose-pine",
      lazy = false, -- make sure we load this during startup if it is your main colorscheme
      priority = 1000, -- make sure to load this before all the other start plugins
      config = function()
        -- load the colorscheme here
        -- vim.cmd([[colorscheme rose-pine]])
        vim.cmd([[colorscheme gruvbox]])
    end,
    },
    {
      "nvim-tree/nvim-tree.lua",
      version = "*",
      lazy = false,
      dependencies = {
        "nvim-tree/nvim-web-devicons",
      },
      config = function()
        require("nvim-tree").setup {}
      end,
    },
    {"christoomey/vim-tmux-navigator"}, -- Navigation between splits
    {'github/copilot.vim'}, -- CoPilot
    {'nvim-tree/nvim-tree.lua'}, -- Filetree
    {'nvim-tree/nvim-web-devicons'}, -- Filetree Icons
    {
      'nvim-treesitter/nvim-treesitter', -- LSP
      config = function()
        require'nvim-treesitter.configs'.setup {
          ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
          sync_install = true,
          auto_install = true,
          ignore_install = { "javascript" },
          highlight = {
            enable = true,
            disable = { "rust" },
            disable = function(lang, buf)
              local max_filesize = 100 * 1024 -- 100 KB
              local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
              if ok and stats and stats.size > max_filesize then
                return true
              end
            end,
            additional_vim_regex_highlighting = false,
          },
        }
      end,
    },
    {
      'prabirshrestha/vim-lsp',
      config = function()
        vim.api.nvim_create_autocmd("BufWritePre", {
          pattern = { "*.rs", "*.go", "*" },
          callback = function()
            vim.cmd("LspDocumentFormat")
          end,
        })
      end,
    }, -- LSP
    {'mattn/vim-lsp-settings'}, -- LSP Settings
    {'hrsh7th/vim-vsnip'},
    {'hrsh7th/vim-vsnip-integ'},
    { "rafamadriz/friendly-snippets" },
    {
      "L3MON4D3/LuaSnip",
      -- follow latest release.
      version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
      -- install jsregexp (optional!).
      build = "make install_jsregexp",
      dependencies = { "rafamadriz/friendly-snippets" },
    }, -- Snippets
    {'ellisonleao/gruvbox.nvim'}, -- Theme
    {'nvim-lua/plenary.nvim'}, -- Plenary
    {'nvim-telescope/telescope.nvim'}, -- Telescope
    {'nvim-telescope/telescope-live-grep-args.nvim'}, -- Telescope extension
    {'akinsho/bufferline.nvim',
      config = function()
        vim.opt.termguicolors = true
        require("bufferline").setup{
          options = {
            style_preset = require('bufferline').style_preset.minimal
          },
        }
      end,
    }, -- Bufferline
    {'ryanoasis/vim-devicons'}, -- More Icons
    {
      'nvim-lualine/lualine.nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons' },
      config = function()
        vim.opt.termguicolors = true
        require('lualine').setup {
          options = {
            icons_enabled = true,
            theme = 'auto',
            component_separators = { left = '', right = '' },
            section_separators = { left = '', right = '' },
            disabled_filetypes = {
              statusline = {},
              winbar = {},
            },
            ignore_focus = {},
            always_divide_middle = true,
            always_show_tabline = true,
            globalstatus = false,
            refresh = {
              statusline = 1000,
              tabline = 1000,
              winbar = 1000,
            }
          },
          sections = {
            lualine_a = { 'mode' },
            lualine_b = { 'branch', 'diff', 'diagnostics' },
            lualine_c = { 'filename' },
            lualine_x = { 'encoding', 'fileformat', 'filetype' },
            lualine_y = { 'location' },
            lualine_z = { "os.date('%H:%M')", 'data', "require'lsp-status'.status()" },
          },
          inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { 'filename' },
            lualine_x = { 'location' },
            lualine_y = {},
            lualine_z = {}
          },
          tabline = {},
          winbar = {},
          inactive_winbar = {},
          extensions = {}
        }
      end,
    },
  
    -- Telescope requires ripgrep (brew install ripgrep)
    {
      "nvim-telescope/telescope.nvim",
        requires = {
          { "nvim-telescope/telescope-live-grep-args.nvim" },
        },
        config = function()
          local telescope = require("telescope")
  
          -- first setup telescope
          telescope.setup({
            -- your config
          })
  
          -- then load the extension
          telescope.load_extension("live_grep_args")
        end,
    },
    {
      'numToStr/Comment.nvim',
      config = function()
          require('Comment').setup()
      end,
      opts = {
          -- add any options here
      },
    },
  
    -- avante.nvim
    {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- set this if you want to always pull the latest change
    opts = {
      -- add any opts here
      provider = "copilot",
      auto_suggestions_provider = "copilot",
      behaviour = {
      auto_suggestions = false, -- Experimental stage
      auto_set_highlight_group = true,
      auto_set_keymaps = true,
      auto_apply_diff_after_generation = false,
      support_paste_from_clipboard = false,
    },
    vendors = {
           ---@type AvanteProvider
           ollama = {
             ["local"] = true,
             endpoint = "127.0.0.1:11434/v1",
             model = "llama3.2",
             parse_curl_args = function(opts, code_opts)
               return {
                 url = opts.endpoint .. "/chat/completions",
                 headers = {
                   ["Accept"] = "application/json",
                   ["Content-Type"] = "application/json",
                 },
                 body = {
                   model = opts.model,
                   messages = require("avante.providers").copilot.parse_message(code_opts), -- you can make your own message, but this is very advanced
                   max_tokens = 2048,
                   stream = true,
                 },
               }
             end,
             parse_response_data = function(data_stream, event_state, opts)
               require("avante.providers").openai.parse_response(data_stream, event_state, opts)
             end,
           },
         },
    mappings = {
      --- @class AvanteConflictMappings
      diff = {
        ours = "co",
        theirs = "ct",
        all_theirs = "ca",
        both = "cb",
        cursor = "cc",
        next = "]x",
        prev = "[x",
      },
      suggestion = {
        accept = "<M-l>",
        next = "<M-]>",
        prev = "<M-[>",
        dismiss = "<C-]>",
      },
      jump = {
        next = "]]",
        prev = "[[",
      },
      submit = {
        normal = "<CR>",
        insert = "<C-s>",
      },
      sidebar = {
        apply_all = "A",
        apply_cursor = "a",
        switch_windows = "<Tab>",
        reverse_switch_windows = "<S-Tab>",
      },
    },
    hints = { enabled = true },
    windows = {
      ---@type "right" | "left" | "top" | "bottom"
      position = "right", -- the position of the sidebar
      wrap = true, -- similar to vim.o.wrap
      width = 30, -- default % based on available width
      sidebar_header = {
        enabled = false, -- true, false to enable/disable the header
        align = "center", -- left, center, right for title
        rounded = true,
      },
      input = {
        prefix = "> ",
      },
      edit = {
        border = "rounded",
        start_insert = true, -- Start insert mode when opening the edit window
      },
      ask = {
        floating = false, -- Open the 'AvanteAsk' prompt in a floating window
        start_insert = true, -- Start insert mode when opening the ask window, only effective if floating = true.
        border = "rounded",
      },
    },
    highlights = {
      ---@type AvanteConflictHighlights
      diff = {
        current = "DiffText",
        incoming = "DiffAdd",
      },
    },
    --- @class AvanteConflictUserConfig
    diff = {
      autojump = true,
      ---@type string | fun(): any
      list_opener = "copen",
    },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        config = function()
            require('render-markdown').setup({})
        end,
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  }
}