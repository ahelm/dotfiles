local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

bufferline.setup {
  options = {
    separator_style = "thin",
    always_show_bufferline = false,
    show_close_icon = false,
    show_buffer_close_icons = false,
  }
}

-- Buffer switching
local keymap = vim.api.nvim_set_keymap
keymap('n', '<leader>n', '<cmd>BufferLineCyclePrev<cr>', { noremap = true })
keymap('n', '<leader>m', '<cmd>BufferLineCycleNext<cr>', { noremap = true })
keymap('i', '<leader>n', '<cmd>BufferLineCyclePrev<cr>', { noremap = true })
keymap('i', '<leader>m', '<cmd>BufferLineCycleNext<cr>', { noremap = true })
