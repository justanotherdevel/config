-- -- lua/mason/mason.lua
-- return {
--     -- Ensure that mason is installed
--     {
--         "williamboman/mason.nvim",
--         config = function()
--             require("mason").setup()
--         end,
--     },
--     {
--         "williamboman/mason-lspconfig.nvim",
--         dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
--         config = function()
--             require("mason-lspconfig").setup()
--         end,
--     },
--     {
--         "neovim/nvim-lspconfig",
--     },
-- }
--
--
return {
  {
    "williamboman/mason.nvim"
  },
  {
    "williamboman/mason-lspconfig.nvim"
  },
  {
    "neovim/nvim-lspconfig",
    version = "v1.0.0",
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  }
}
