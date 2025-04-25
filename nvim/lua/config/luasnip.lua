local luasnip = require("luasnip")

-- Load snippets from VS Code-style snippets (from friendly-snippets or other sources)
require("luasnip.loaders.from_vscode").lazy_load()

-- You can also load your custom snippets here, if you have any.
require("luasnip.loaders.from_lua").lazy_load({ paths = { "./snippets" } })

-- Configure LuaSnip options (optional)
luasnip.config.set_config({
  history = true,                              -- Keep the last snippet around for jumping back
  updateevents = "TextChanged,TextChangedI",   -- Update snippets as you type
  enable_autosnippets = true,
})

-- Keybindings for expanding and jumping through snippets
vim.api.nvim_set_keymap("i", "<C-l>", "<cmd>lua require('luasnip').expand_or_jump()<CR>",
  { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-h>", "<cmd>lua require('luasnip').jump(-1)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("s", "<C-l>", "<cmd>lua require('luasnip').expand_or_jump()<CR>",
  { noremap = true, silent = true })
vim.api.nvim_set_keymap("s", "<C-h>", "<cmd>lua require('luasnip').jump(-1)<CR>", { noremap = true, silent = true })

-- For choice nodes
vim.api.nvim_set_keymap("i", "<C-j>", "<cmd>lua require('luasnip').change_choice(1)<CR>",
  { noremap = true, silent = true })
vim.api.nvim_set_keymap("s", "<C-j>", "<cmd>lua require('luasnip').change_choice(1)<CR>",
  { noremap = true, silent = true })
