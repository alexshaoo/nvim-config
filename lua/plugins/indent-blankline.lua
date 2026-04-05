return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPre", "BufNewFile" },
  main = "ibl",
  opts = {
    indent = { char = "┊" },
    scope = {
      enabled = true,
      show_start = true,
      show_end = true,
      show_exact_scope = true,
      highlight = { "IblScope" },
    },
  },
}
