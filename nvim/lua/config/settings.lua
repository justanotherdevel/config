-- lua/config/settings.lua

local opt = vim.opt

opt.number = true         -- Show line numbers
opt.relativenumber = true -- Show relative line numbers
opt.termguicolors = true  -- Enable true colors
opt.smartindent = true    -- Enable smart indent
opt.ignorecase = true     -- Ignore case in search
opt.smartcase = true      -- Enable smart case for searches
opt.history = 10000       -- Command history size
opt.scrolloff = 0         -- Number of lines to keep above and below the cursor
opt.hidden = true         -- Enable background buffers
opt.updatetime = 300      -- Faster completion
opt.signcolumn = "yes"    -- Always show sign column
opt.tabstop = 2           -- Number of spaces tabs count for
opt.shiftwidth = 2        -- Size of an indent
opt.expandtab = true      -- Use spaces instead of tabs
opt.foldenable = false    -- Disable fold
opt.foldmethod = "indent" -- Fold based on indentation
opt.foldlevel = 2         -- Default fold level
opt.mouse = "a"           -- Enable mouse support
opt.clipboard = ""        -- Use vim clipboard
opt.timeoutlen = 300      -- Shorten key timeout length for which-key

-- Set up backup directory
vim.opt.backup = true
vim.opt.backupdir = vim.fn.expand("~/.cache/nvim/backup//")

-- Set up swap directory
vim.opt.directory = vim.fn.expand("~/.cache/nvim/swap//")

-- Enable undofile and set up undo directory
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.cache/nvim/undo//")


-- Enable spell check for specific file types (migrated from vimrc.vim)
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "text" },
  command = "setlocal spell"
})

-- Set transparent background
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")

-- Set the colorscheme (if not in a separate colorscheme config)
vim.cmd("colorscheme tokyonight")

-- Copilot stuff
vim.g.copilot_no_tab_map = true
-- Accept suggestion with Alt-Tab
vim.api.nvim_set_keymap("i", "<C-space>", 'copilot#Accept("\\<CR>")', { silent = true, expr = true })

-- Trigger Copilot suggestion with Alt-\
vim.api.nvim_set_keymap("i", "<A-\\>", "<Plug>(copilot-suggest)", {})

-- Navigate to next suggestion with Alt-]
vim.api.nvim_set_keymap("i", "<A-]>", "<Plug>(copilot-next)", {})

-- Navigate to previous suggestion with Alt-[
vim.api.nvim_set_keymap("i", "<A-[>", "<Plug>(copilot-previous)", {})

-- Cancel Copilot suggestion with Alt-c
vim.api.nvim_set_keymap("i", "<A-c>", "<Plug>(copilot-cancel)", {})

-- Open Copilot panel with Alt-p in normal mode
vim.api.nvim_set_keymap("n", "<A-p>", ":Copilot panel<CR>", { silent = true })
