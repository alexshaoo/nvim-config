return {
  "lervag/vimtex",
  lazy = false,
  init = function()
    vim.g.vimtex_view_method = "skim"
    vim.g.vimtex_compiler_progname = "nvr"
    vim.g.vimtex_quickfix_mode = 0
    vim.g.vimtex_compiler_method = "latexmk"
    vim.g.vimtex_compiler_latexmk = {
      options = {
        "-pdf",
        "-interaction=nonstopmode",
        "-synctex=1",
      },
    }
    vim.g.vimtex_view_skim_sync = 1
    vim.g.vimtex_view_forward_search = 1
  end,
  config = function()
    vim.keymap.set("n", "<leader>lv", "<cmd>VimtexView<cr>", { desc = "View LaTeX PDF" })
    vim.keymap.set("n", "<leader>ll", "<cmd>VimtexCompile<cr>", { desc = "Compile LaTeX" })
    vim.keymap.set("n", "<leader>lk", "<cmd>VimtexCompileStop<cr>", { desc = "Stop Compile" })
    vim.keymap.set("n", "<leader>lc", "<cmd>VimtexClean<cr>", { desc = "Clean aux files" })
  end,
}
