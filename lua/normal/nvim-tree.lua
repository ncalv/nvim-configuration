require('nvim-tree').setup {
  update_cwd = true,

  update_focused_file = {
    enable = true,
    update_cwd = true,
  },

  renderer = {
    icons = {
      glyphs = {
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          untracked = "?",
          deleted = "",
          ignored = "◌",
        },
      }
    }
  }
}

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

local function open_nvim_tree(data)

  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  if not directory then
    return
  end

  -- change to the directory
  vim.cmd.cd(data.file)

  -- open the tree
  require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
