-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Load core settings
require("config.lazy")
require("config.settings")
require("config.mappings")
require("config.autocmds")
require("config.ui")
require("config.cmp")
require("lsp")

-- Customize fzf layout
vim.g.fzf_layout = { window = { width = 0.9, height = 0.6, border = 'rounded' } }

-- Set up fzf preview window
vim.g.fzf_preview_window = { 'right:50%', 'ctrl-/' }

-- Customize fzf colors to match your colorscheme
vim.cmd [[
  let g:fzf_colors =
  \ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
]]
