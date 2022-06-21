local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

nvim_tree.setup()

-- Keymaps
vim.api.nvim_set_keymap('n', '<c-n>', '<cmd>NvimTreeToggle<cr>', {noremap = true})
