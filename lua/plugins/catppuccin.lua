return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      transparent_background = true,
      integrations = {
        indent_blankline = {
          enabled = true,
          scope_color = "sapphire",
        },
      },
      custom_highlights = function(colors)
        return {
          IblScope = { fg = colors.sapphire },
          LineNrAbove = { fg = colors.overlay1 },
          LineNrBelow = { fg = colors.overlay1 },
        }
      end,
    })
    vim.cmd.colorscheme("catppuccin")
  end,
}
