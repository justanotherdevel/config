return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "rafamadriz/friendly-snippets",
      "mlaursen/vim-react-snippets"
    },
    config = function()
      -- Add your cmp setup here
    end,
  },
}
