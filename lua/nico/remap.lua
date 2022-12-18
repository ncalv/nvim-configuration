vim.g.mapleader = " "
-- show file explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- center cursor during scrolling 
vim.keymap.set("n", "<C-d>", "015jzz")
vim.keymap.set("n", "<C-u>", "015kzz")
