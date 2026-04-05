return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        cpp = { "clang-format" },
        c = { "clang-format" },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      },
    })
    -- <leader> (space) + f manually formats
    vim.keymap.set({ "n", "v" }, "<leader>cf", function()
      require("conform").format({ 
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      })
    end, { desc = "Format file or range" })
  end,
}
