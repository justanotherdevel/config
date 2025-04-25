local M = {}

M.on_attach = function(client, bufnr)
  -- Helper function to set key mappings specific to LSP
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  -- Options for mappings
  local opts = { noremap = true, silent = true }

  -- Set up LSP-specific keybindings
  buf_set_keymap("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", "<leader>gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  buf_set_keymap("n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  buf_set_keymap("n", "<leader>K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  buf_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  buf_set_keymap("n", "<leader>[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
  buf_set_keymap("n", "<leader>]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
  buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.format({ async = false })<CR>", opts)

  -- Enable formatting capability if available
  --   if client.server_capabilities.documentFormattingProvider then
  --     vim.api.nvim_buf_create_user_command(bufnr, "Format", function()
  --       vim.lsp.buf.format({ bufnr = bufnr })
  --     end, { desc = "Format the current buffer using LSP" })
  --   end
  --
  --   -- Format on save setup
  --   if client.server_capabilities.documentFormattingProvider then
  --     vim.api.nvim_create_autocmd("BufWritePre", {
  --       group = vim.api.nvim_create_augroup("LspFormatting", { clear = true }),
  --       buffer = bufnr,
  --       callback = function()
  --         vim.lsp.buf.format({ bufnr = bufnr })
  --       end,
  --     })
  --   end
end

return M
