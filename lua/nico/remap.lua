vim.g.mapleader = " "
-- show file explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- center cursor during scrolling 
vim.keymap.set("n", "<C-d>", "0<C-d>zz")
vim.keymap.set("n", "<C-u>", "0<C-u>zz")
