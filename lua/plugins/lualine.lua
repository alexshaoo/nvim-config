return {
  "nvim-lualine/lualine.nvim",
  dependencies = { 
    "nvim-tree/nvim-web-devicons",
    "catppuccin",
  },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status")
    local catppuccin_theme = require("catppuccin.utils.lualine")()
    lualine.setup({
      options = {
        theme = catppuccin_theme,
      },
      sections = {
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#fab387" },
          },
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
      },
    })
  end,
}
