local cmp = require("cmp")
local luasnip = require("luasnip")

-- Load friendly-snippets (optional but recommended)
require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
  snippet = {
    -- Specify how to expand snippets.
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "path" },
    { name = "luasnip" },
  },
  mapping = {
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }), -- Specify "i" (insert) and "s" (select) mode

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<C-j>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }), -- Specify "i" (insert) and "s" (select) mode

    ["<C-k>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),


    ["<A-Tab>"] = cmp.mapping.confirm({ select = true }),

    -- Optionally, you can add other mappings like Ctrl-Space for manual trigger
    ["<C-A-Space>"] = cmp.mapping.complete(),
  },
})

require("flutter-tools").setup {
  ui = {
    border = "rounded",
  },
  decorations = {
    statusline = {
      app_version = true,
      device = true,
    },
  },
  widget_guides = {
    enabled = true,
  },
  closing_tags = {
    highlight = "Comment", -- change this to your preferred highlight
  },
  lsp = {
    on_attach = require("lsp.on_attach").on_attach, -- your custom LSP on_attach function
    color = { -- show the derived colours for dart variables
      enabled = true, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
      background = true, -- highlight the background
      background_color = nil, -- required, when background is transparent (i.e. background_color = { r = 19, g = 17, b = 24},)
      foreground = true, -- highlight the foreground
      virtual_text = true, -- show the highlight using virtual text
      virtual_text_str = "■", -- the virtual text character to highlight
    },
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
  },

} -- use defaults

require("telescope").load_extension("flutter")
