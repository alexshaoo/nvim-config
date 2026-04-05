-- Maintains a stack of "working" windows so that closing terminal/scratch
-- splits (e.g. after :Compile/:Run/:CompileRun) returns focus to the last
-- real editing window instead of NvimTree.

local M = {}

local win_stack = {}

local function is_working_win(win)
  if not vim.api.nvim_win_is_valid(win) then return false end
  local buf = vim.api.nvim_win_get_buf(win)
  local ft = vim.bo[buf].filetype
  local bt = vim.bo[buf].buftype
  if ft == "NvimTree" then return false end
  if bt == "terminal" then return false end
  if bt == "quickfix" then return false end
  if bt == "nofile" then return false end
  if bt == "prompt" then return false end
  return true
end

local function push_win(win)
  for i = #win_stack, 1, -1 do
    if win_stack[i] == win then
      table.remove(win_stack, i)
    end
  end
  table.insert(win_stack, win)
  if #win_stack > 20 then
    table.remove(win_stack, 1)
  end
end

local function get_best_win()
  for i = #win_stack, 1, -1 do
    local win = win_stack[i]
    if vim.api.nvim_win_is_valid(win) and is_working_win(win) then
      return win
    end
    table.remove(win_stack, i)
  end
  return nil
end

function M.setup()
  local group = vim.api.nvim_create_augroup("WindowFocusStack", { clear = true })

  vim.api.nvim_create_autocmd("WinEnter", {
    group = group,
    callback = function()
      local win = vim.api.nvim_get_current_win()
      if is_working_win(win) then
        push_win(win)
      end
    end,
  })

  vim.api.nvim_create_autocmd("WinClosed", {
    group = group,
    callback = function()
      vim.schedule(function()
        local cur = vim.api.nvim_get_current_win()
        if not is_working_win(cur) then
          local best = get_best_win()
          if best then
            vim.api.nvim_set_current_win(best)
          end
        end
      end)
    end,
  })
end

return M
