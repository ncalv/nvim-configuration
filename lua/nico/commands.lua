local function create_file(t)
  local path = vim.fn.expand('%:p:h')
  vim.api.nvim_command('!touch '.. path .. '/' .. t.args)
end

vim.api.nvim_create_user_command('Cf', create_file, { nargs=1 })


local function print_nvim_path()
  print(vim.fn.expand('%:p:h'))
end

vim.api.nvim_create_user_command('PrintNvimPath', print_nvim_path, {})
