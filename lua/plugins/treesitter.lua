return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = {
        "c", "cpp", "rust", "python", "lua", "vim", "vimdoc", "query",
        "bash", "make", "cmake", "javascript", "typescript", "go",
        "json", "yaml", "toml", "dockerfile", "markdown", "markdown_inline"
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<CR>",
          node_incremental = "<CR>",
          scope_incremental = "<Tab>",
          node_decremental = "<BS>",
        },
      },
    })
  end,
}
