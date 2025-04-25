local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Better window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Toggle NERDTree (or nvim-tree)
map("n", "<leader>N", ":NvimTreeToggle<CR>", opts)
map("n", "<leader>Nr", ":NvimTreeRefresh<CR>", opts)
map("n", "<leader>Nr", ":NvimTreeFindFile<CR>", opts)

-- Toggle Tagbar
map("n", "<leader>tb", ":TagbarToggle<CR>", opts)

-- Buffer navigation
map("n", "<leader>n", ":bn<CR>", opts)
map("n", "<leader>p", ":bp<CR>", opts)
map("n", "<leader>gt", "<C-^>", opts) -- Switch to the last buffer

-- Save and close
map("n", "<leader>w", ":w<CR>", opts)
map("n", "<leader>q", ":q<CR>", opts)

-- Remap to remove search highlights
map("n", "<leader>/", ":noh<CR>", opts)

-- Toggle rainbow parentheses
map("n", "<leader>tR", ":RainbowToggle<CR>", opts)

-- Easy tab management
map("n", "<leader>tn", ":tabnew<CR>", opts)
map("n", "<leader>to", ":tabonly<CR>", opts)
map("n", "<leader>tc", ":tabclose<CR>", opts)

-- Check if LSP is available before defining these mappings
local lsp_buf = vim.lsp.buf
if lsp_buf then
  -- LSP GoTo code navigation
  map("n", "<leader>gd", lsp_buf.definition, opts)
  map("n", "<leader>gy", lsp_buf.type_definition, opts)
  map("n", "<leader>gi", lsp_buf.implementation, opts)
  map("n", "<leader>gr", lsp_buf.references, opts)

  -- Rename symbol
  map("n", "<leader>rn", lsp_buf.rename, opts)

  -- Quick fix for current issue
  map("n", "<leader>qf", lsp_buf.code_action, opts)

  -- Show documentation
  map("n", "<leader>K", lsp_buf.hover, opts)

  -- Format current buffer
  map("n", "<leader>ff", function()
    lsp_buf.format { async = true }
  end, opts)
end

-- Navigate diagnostics
map("n", "<leader>[g", vim.diagnostic.goto_prev, opts)
map("n", "<leader>]g", vim.diagnostic.goto_next, opts)

-- LuaSnip keybindings
map("i", "<C-k>", "<cmd>lua require('luasnip').expand_or_jump()<CR>", opts)
map("i", "<C-j>", "<cmd>lua require('luasnip').jump(-1)<CR>", opts)

-- Buffer Delete
map("n", "<leader>bd", ":Bclose<CR>", opts)

-- Mappings for Telescope
map("n", "<leader><c-f>", ":Telescope find_files<CR>", opts)
map("n", "<leader>gf", ":Telescope find_files cwd=.<CR>", opts)
map("n", "<leader>gF", ":Telescope find_files cwd=/<CR>", opts)
map("n", "<leader>gb", ":Telescope buffers<CR>", opts)
map("n", "<leader>gFt", ":Telescope tags<CR>", opts)
map("n", "<leader>gFc", ":Telescope git_commits<CR>", opts)
map("n", "<leader>gFg", ":Telescope git_files<CR>", opts)
map("n", "<leader>gL", ":Telescope live_grep<CR>", opts)
map("n", "<leader>gl", ":Telescope current_buffer_fuzzy_find<CR>", opts)
map("n", "<leader>gFh", ":Telescope oldfiles<CR>", opts)
map("n", "<leader>gFm", ":Telescope help_tags<CR>", opts)
map("n", "<leader>gFr", ":Telescope grep_string<CR>", opts)
map("n", "<leader>fc", ":Telescope commands<CR>", opts)
