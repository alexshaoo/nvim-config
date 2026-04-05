return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  config = function()
    require("bufferline").setup({
      options = {
        mode = "tabs",
        separator_style = "thin",
      },
      highlights = require("catppuccin.special.bufferline").get_theme(),
    })
  end,
}
