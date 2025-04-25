-- lua/plugins/neodev.lua

require("neodev").setup({
  library = { plugins = { "nvim-treesitter", "plenary.nvim" }, types = true },
  runtime_path = true,
})
