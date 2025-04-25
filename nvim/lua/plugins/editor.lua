return {
  {
    "Wansmer/treesj",
    keys = {
      { "J", "<cmd>TSJToggle<cr>", desc = "Join Toggle" },
    },
    opts = { use_default_keymaps = false, max_join_length = 150 },
  },
  {
    "monaqa/dial.nvim",
    keys = { "<C-a>", { "<C-x>", mode = "n" } },
  },
  {
    "rbgrouleff/bclose.vim"
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" }, -- Optional
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({
        check_ts = true, -- Enable treesitter integration for better pairing
      })

      -- If you're using nvim-cmp, integrate it with autopairs for better handling
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup({
        autotag = {
          enable = true,
        },
      })
    end,
  },
  {
    "ludovicchabant/vim-gutentags",
    config = function()
      -- Configure Gutentags
      vim.g.gutentags_ctags_tagfile = ".tags" -- Tag file to use for each project
      vim.g.gutentags_project_root = { ".git", ".hg", ".svn", "Makefile", "package.json" }
      vim.g.gutentags_generate_on_write = 1   -- Automatically generate tags on write
      vim.g.gutentags_generate_on_missing = 1 -- Generate tags if missing
      vim.g.gutentags_cache_dir = vim.fn.expand("~/.cache/tags")
    end,
  },
  {
    "preservim/tagbar",
    cmd = "TagbarToggle",
    keys = {
      { "<leader>tb", ":TagbarToggle<CR>", desc = "Toggle Tagbar" },
    },
    config = function()
      vim.g.tagbar_ctags_bin = "ctags" -- Ensure it uses the correct ctags binary
      vim.g.tagbar_width = 30
      vim.g.tagbar_autofocus = 1
    end,
  },
  {
    "junegunn/fzf",
    build = function()
      vim.fn["fzf#install"]()
    end,
    event = "VeryLazy",
    dependencies = {
      "junegunn/fzf.vim",
    },
  },

  {
    "github/copilot.vim",
    config = function()
      -- Additional configuration if needed
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-media-files.nvim",
        config = function()
          require("telescope").load_extension("media_files")
        end,
      },
    },
    cmd = "Telescope",
    keys = {
      "<leader><c-f>", "<leader>gf", "<leader>gF", "<leader>gb",
      "<leader>gFt", "<leader>gFc", "<leader>gFg", "<leader>gL",
      "<leader>gl", "<leader>gFh", "<leader>gFm", "<leader>gFr"
    },
  },

  {
    "nvim-flutter/flutter-tools.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = true,
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use the latest version
    config = function()
      require("nvim-surround").setup({})
    end,
  }


  -- {
  --   "yuezk/vim-js"
  -- },
}
