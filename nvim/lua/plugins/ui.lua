return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
  },
  {
    "norcalli/nvim-colorizer.lua"
  },
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },
  {
    "echasnovski/mini.icons",
    config = function()
      require("mini.icons").setup()
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufRead",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
        ignore_install = { "javascript" },
        disable = { "javascript" },
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true, -- Enable treesitter highlighting
        },
        rainbow = {
          enable = true,
          extended_mode = true,  -- Highlight non-bracket delimiters like HTML tags
          max_file_lines = 1000, -- Disable for files with more than 1000 lines
        },
      })
    end,
  },
  {
    "thiagoalessio/rainbow_levels.vim",
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPre",
    config = function()
      require("ibl").setup {}
    end,
  },

  {
    "kdheepak/lazygit.nvim",
    cmd = "LazyGit",
    keys = {
      { "<leader>lg", ":LazyGit<CR>", desc = "Open LazyGit", silent = true }
    },
    config = function()
      vim.api.nvim_set_keymap("n", "<leader>lg", ":LazyGit<CR>", { noremap = true, silent = true })
    end,
  },
  {
    "ggandor/lightspeed.nvim",
    config = function()
      require('lightspeed').setup({})
    end
  },

  {
    "karb94/neoscroll.nvim",
    config = function()
      require('neoscroll').setup({})
    end
  },

  {
    "rcarriga/nvim-notify",
    keys = {
      {
        "<leader>un",
        function()
          require("notify").dismiss({ silent = true, pending = true })
        end,
        desc = "Dismiss All Notifications",
      },
    },
    opts = {
      stages = "static",
      timeout = 3000,
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
      on_open = function(win)
        vim.api.nvim_win_set_config(win, { zindex = 100 })
      end,
    },
  },

  -- illuminate
  {
    "RRethy/vim-illuminate",
    config = function()
      require("illuminate").configure({
        delay = 300, -- Delay in milliseconds before highlighting (adjust as needed)
        filetypes_denylist = {
          "NvimTree",
          "packer",
          "alpha",
        },
        providers = {
          "lsp",
          "treesitter",
          "regex",
        },
        under_cursor = false, -- Don't underline the word under the cursor itself
      })
    end,
    event = "BufReadPost", -- Load when opening a file
  }

}
