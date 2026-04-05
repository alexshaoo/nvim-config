vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", function()
  local cur_win = vim.api.nvim_get_current_win()
  local target_win = nil

  -- Try alternate window first (the one we were in before)
  local alt_winnr = vim.fn.winnr('#')
  if alt_winnr ~= 0 and alt_winnr ~= vim.fn.winnr() then
    local alt_win = vim.fn.win_getid(alt_winnr)
    if alt_win ~= cur_win then
      local ft = vim.bo[vim.api.nvim_win_get_buf(alt_win)].filetype
      if ft ~= "NvimTree" then
        target_win = alt_win
      end
    end
  end

  -- Fallback: any non-NvimTree, non-current window
  if not target_win then
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      if win ~= cur_win then
        local ft = vim.bo[vim.api.nvim_win_get_buf(win)].filetype
        if ft ~= "NvimTree" then
          target_win = win
          break
        end
      end
    end
  end

  vim.cmd("close")

  if target_win and vim.api.nvim_win_is_valid(target_win) then
    vim.api.nvim_set_current_win(target_win)
  end
end, { desc = "Close current split" })

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

vim.keymap.set('n', 'gl', function()
  vim.diagnostic.setloclist({ open = false })
  if #vim.fn.getloclist(0) == 0 then
    vim.notify("No diagnostics", vim.log.levels.INFO)
    return
  end
  vim.cmd('botright lopen')
end, { desc = "Show diagnostics in location list" })
vim.keymap.set('n', '[d', function()
  vim.diagnostic.goto_prev({ float = false })
  vim.diagnostic.setloclist({ open = false })
  if #vim.fn.getloclist(0) > 0 then
    vim.cmd('botright lopen')
    vim.cmd('wincmd p')
  end
end, { desc = "Previous diagnostic" })
vim.keymap.set('n', ']d', function()
  vim.diagnostic.goto_next({ float = false })
  vim.diagnostic.setloclist({ open = false })
  if #vim.fn.getloclist(0) > 0 then
    vim.cmd('botright lopen')
    vim.cmd('wincmd p')
  end
end, { desc = "Next diagnostic" })

keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap = true })
