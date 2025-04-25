-- lua/plugins/colorscheme.lua

return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        transparent = true,         -- Keeps the main background solid
        styles = {
          sidebars = "transparent", -- Makes sidebars transparent
          floats = "transparent",   -- Makes floating windows transparent
        },
        on_colors = function(colors)
          colors.bg = "#1a1b26" -- Sets a custom background for the main editor window
        end,
        on_highlights = function(hl, c)
          -- Darken the background of the line number column
          hl.LineNr = {
            fg = "#ffffff", -- Use a slightly darker foreground for line numbers
            -- bg = "#11111b", -- Custom darker background for better visibility
          }
          -- Darken the background of the sign column (gutter)
          -- hl.SignColumn = {
          --     bg = "#11111b", -- Use a similar darker background for the sign column
          -- }
        end,
      })
      vim.cmd([[colorscheme tokyonight]])
      vim.cmd [[
        hi link FlutterWidgetGuides Comment
        hi link FlutterClosingTag Comment
      ]]
    end,
  },
}
