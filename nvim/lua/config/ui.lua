require("colorizer").setup({
  '*',                 -- Enable for all file types
}, {
  mode = 'background', -- Set the display mode ('foreground', 'background', or 'virtualtext')
  names = true,        -- Enable parsing of color names like 'Red', 'Blue', etc.
})
-- Enable colorizer for all buffers on startup
vim.cmd('ColorizerAttachToBuffer')


-- Lua line config
require('lualine').setup({
  options = {
    theme = 'tokyonight', -- Change this to your preferred colorscheme
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = { 'NvimTree', 'packer' }, -- Add filetypes you want to exclude
  },
  sections = {
    lualine_a = { 'mode' },                               -- Shows the current mode
    lualine_b = { 'branch', 'diff', 'diagnostics' },      -- Git branch and diff, diagnostics
    lualine_c = {
      'filename', 'readonly', 'relativepath', 'modified', -- File info
    },
    lualine_x = { 'encoding', 'fileformat', 'filetype' }, -- File properties
    lualine_y = { 'progress' },                           -- Line number and percentage
    lualine_z = { 'location' },                           -- Cursor location in the file
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
  extensions = { 'fugitive' } -- Load any lualine extensions here, like NvimTree, fugitive, etc.
})

require('neoscroll').setup({
  mappings = { -- Keys to be mapped to their corresponding default scrolling animation
    '<C-u>', '<C-d>',
    '<C-b>', '<C-f>',
    '<C-y>', '<C-e>',
    'zt', 'zz', 'zb',
  },
  hide_cursor = true,          -- Hide cursor while scrolling
  stop_eof = true,             -- Stop at <EOF> when scrolling downwards
  respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
  cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
  easing = 'linear',           -- Default easing function
  pre_hook = nil,              -- Function to run before the scrolling animation starts
  post_hook = nil,             -- Function to run after the scrolling animation ends
  performance_mode = false,    -- Disable "Performance Mode" on all buffers.
  ignored_events = {           -- Events ignored while scrolling
    'WinScrolled', 'CursorMoved'
  },
})

-- fzf configuration
vim.cmd([[
  let g:fzf_layout = { 'down': '~40%' }
  let g:fzf_preview_window = ['right:50%', 'ctrl-/']
]])

-- For fzf integration with ripgrep (if you have rg installed)
vim.cmd([[
  command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
    \   fzf#vim#with_preview(), <bang>0)
]])


-- Telescope configuration
require('telescope').setup({
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = require('telescope.actions').move_selection_next,
        ["<C-k>"] = require('telescope.actions').move_selection_previous,
        ["<Esc>"] = require('telescope.actions').close,
        ["<CR>"] = require('telescope.actions').select_default,
      },
      n = {
        ["<C-j>"] = require('telescope.actions').move_selection_next,
        ["<C-k>"] = require('telescope.actions').move_selection_previous,
        ["<Esc>"] = require('telescope.actions').close,
        ["<CR>"] = require('telescope.actions').select_default,
      },
    },
    file_ignore_patterns = { "node_modules" },
  },
  pickers = {
  },
  extensions = { "flutter" },
})

-- notifications
-- local notify = require("notify")
--     notify.setup({
--       stages = "fade_in_slide_out", -- Animation style
--       timeout = 3000,               -- Time in milliseconds before the notification closes
--       background_colour = "#000000",-- Background color for notifications
--       icons = {
--         ERROR = "",
--         WARN = "",
--         INFO = "",
--         DEBUG = "",
--         TRACE = "✎",
--       },
--     })
--     vim.notify = notify
