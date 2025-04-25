return {
  {
    "amitds1997/remote-nvim.nvim",
    version = "*",                      -- Pin to GitHub releases
    dependencies = {
      "nvim-lua/plenary.nvim",          -- For standard functions
      "MunifTanjim/nui.nvim",           -- To build the plugin UI
      "nvim-telescope/telescope.nvim",  -- For picking b/w different remote methods
    },
    config = true,
  },
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
    init = function()
      vim.g.startuptime_tries = 10
    end,
  },
  {
    "nvim-neorg/neorg",
    ft = "norg",
    opts = {
      load = {
        ["core.defaults"] = {},
      },
    },
  },
  -- Local plugins
  { dir = "~/projects/secret.nvim" },
  { url = "git@github.com:folke/noice.nvim.git" },
  { "folke/noice.nvim",                         dev = true },
  {
    "Shatur/neovim-session-manager",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local Path = require('plenary.path')
      require('session_manager').setup({
        sessions_dir = Path:new(vim.fn.stdpath('data'), 'sessions'),                -- The directory where session files are stored.
        path_replacer = '__',                                                       -- Character to which the path separator will be replaced for session files.
        colon_replacer = '++',                                                      -- Character to which the colon symbol will be replaced for session files.
        autoload_mode = require('session_manager.config').AutoloadMode.Disabled,
        autosave_last_session = true,                                               -- Automatically save the session on VimExit.
        autosave_ignore_not_normal = true,                                          -- Do not autosave if the session is not normal mode.
        autosave_ignore_filetypes = { 'gitcommit', 'gitrebase', 'fugitive' },       -- File types to ignore when saving sessions.
        autosave_only_in_session = false,                                           -- Always autosave even if not in a session.
      })
    end,
  },
  {
    "tpope/vim-repeat",
    event = "VeryLazy", -- Load it lazily to improve startup time.
  },
  {
    "themaxmarchuk/tailwindcss-colors.nvim",
    config = function()
      require("tailwindcss-colors").setup({
        color_square_width = 2, -- Width of the color preview squares
        -- Other configuration options can go here if needed
      })
    end,
    dependencies = "nvim-treesitter/nvim-treesitter", -- Make sure to include treesitter for proper parsing
    event = "BufReadPost"                             -- Load when reading a file for better performance
  }



}
