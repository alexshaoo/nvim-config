require("core")
require("lazy_setup")

vim.api.nvim_create_user_command("Compile", function()
  local file = vim.fn.expand("%:p")
  local outfile = vim.fn.expand("%:p:r")
  local cmd = string.format('g++-15 -std=c++23 -Wall -Wextra -O2 "%s" -o "%s"', file, outfile)
  vim.cmd('botright 12split | terminal ' .. cmd)
end, { desc = 'Compile current C++ file with C++23' })

local function complete_txt_files(arg_lead)
  local dir = vim.fn.expand("%:p:h")
  local files = vim.fn.glob(dir .. "/*.txt", false, true)
  local names = {}
  for _, f in ipairs(files) do
    local name = vim.fn.fnamemodify(f, ":t")
    if name:find("^" .. vim.pesc(arg_lead)) then
      names[#names + 1] = name
    end
  end
  return names
end

vim.api.nvim_create_user_command("Run", function(opts)
  local outfile = vim.fn.expand("%:p:r")
  local infile = opts.args
  if infile == "" then
    infile = vim.fn.expand("%:p:h") .. "/input.txt"
  elseif infile:sub(1, 1) ~= "/" then
    infile = vim.fn.expand("%:p:h") .. "/" .. infile
  end
  local cmd = string.format('"%s" < "%s"', outfile, infile)
  vim.cmd('botright 12split | terminal ' .. cmd)
end, {
    nargs = '?',
    complete = complete_txt_files,
    desc = 'Run compiled C++ file with input (can specify)'
})

vim.api.nvim_create_user_command("CR", function(opts)
  local file = vim.fn.expand("%:p")
  local outfile = vim.fn.expand("%:p:r")
  local infile = opts.args
  if infile == "" then
    infile = vim.fn.expand("%:p:h") .. "/input.txt"
  elseif infile:sub(1, 1) ~= "/" then
    infile = vim.fn.expand("%:p:h") .. "/" .. infile
  end
  local compile_cmd = string.format('g++-15 -std=c++23 -Wall -Wextra -O2 "%s" -o "%s"', file, outfile)
  local run_cmd = string.format('"%s" < "%s"', outfile, infile)
  local cmd = string.format('%s && %s', compile_cmd, run_cmd)
  vim.cmd('botright 12split | terminal ' .. cmd)
end, {
    nargs = '?',
    complete = complete_txt_files,
    desc = 'Compile and run current C++ file with input (usage: :CR [input_file])'
})

vim.api.nvim_create_user_command("Terminal", function()
  local dir = vim.fn.expand("%:p:h")
  vim.cmd("botright 12split")
  vim.cmd("lcd " .. vim.fn.fnameescape(dir))
  vim.cmd("terminal")
end, { desc = "Open terminal in current file's directory" })

-- remove auto comments on newlines
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ "r", "o" })
  end,
})

