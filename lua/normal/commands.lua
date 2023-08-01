local function create_file(t)
  local path = vim.fn.expand('%:p:h')
  vim.api.nvim_command('!touch '.. path .. '/' .. t.args)
end

vim.api.nvim_create_user_command('Cf', create_file, { nargs=1 })


local function print_nvim_path()
  print(vim.fn.expand('%:p:h'))
end

vim.api.nvim_create_user_command('PrintNvimPath', print_nvim_path, {})


local function execute_current_buf_as_python()
  local res_command = '!python -c '
  local buf_lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

  -- escape quotes so it is a correct string for fish shell
  local function escape_quotes(str)
    local escaped_str = ''
    for i = 1, string.len(str) do
      local ch = string.sub(str, i, i)
      if ch == '"' or ch == '\''
      then
        escaped_str = escaped_str .. '\\' .. ch
      else
        escaped_str = escaped_str .. ch
      end
    end

    return escaped_str
  end

  for _, val in pairs(buf_lines) do
    res_command = res_command .. '"' .. escape_quotes(val) .. '"\\n'
  end

  vim.api.nvim_command(res_command)
end

local function print_current_buf_name()
  print(vim.api.nvim_buf_get_name(0))
end

vim.api.nvim_create_user_command('GetBufName', print_current_buf_name, {})

vim.api.nvim_create_user_command('Pyrun', execute_current_buf_as_python, {})

