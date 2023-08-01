local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  vim.cmd [[packadd packer.nvim]]
end


require('packer').startup(function(use)

  use { 'phaazon/hop.nvim', branch = 'v2'}
  use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines

end)

local hop = require('hop')
vim.keymap.set('n', '<leader>f', hop.hint_words, {remap=true})
vim.keymap.set('n', '<leader>c', hop.hint_char1, {remap=true})
hop.setup()

-- Enable Comment.nvim
require('Comment').setup()