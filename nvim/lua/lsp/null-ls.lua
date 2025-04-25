local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettier.with({
      filetypes = { "javascript", "typescript", "typescriptreact", "javascriptreact", "json", "yaml", "markdown", "css", "scss", "html" },
    }),
     -- Custom Dart formatter
    null_ls.builtins.formatting.stylua.with({
       command = "dart",
      args = { "format", "$FILENAME" }, -- Format using a temporary file
      filetypes = { "dart" },
      to_temp_file = true,  -- Use a temporary file for formatting
    }),
  },
  on_attach = function(client, bufnr)
    -- Create a :Format command if the client supports formatting
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_buf_create_user_command(bufnr, "Format", function()
        vim.lsp.buf.format({ bufnr = bufnr })
      end, { desc = "Format the current buffer using LSP" })
      -- Format on save
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup("LspFormatting", { clear = true }),
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
})
