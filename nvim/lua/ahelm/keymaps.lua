-- Leader
vim.cmd 'let mapleader=","'

-- Save
vim.api.nvim_set_keymap('n', '<leader>w', '<cmd>update<cr>', { noremap = true })
vim.api.nvim_set_keymap('v', '<leader>w', '<c-c><cmd>update<cr>', { noremap = true })
vim.api.nvim_set_keymap('i', '<leader>w', '<c-o><cmd>update<cr>', { noremap = true })

-- Quit
vim.api.nvim_set_keymap('n', '<leader>q', '<cmd>bd<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>Q', '<cmd>qa<cr>', { noremap = true })

-- Windows
vim.api.nvim_set_keymap('n', '<c-h>', '<c-w><c-h>', { noremap = true })
vim.api.nvim_set_keymap('n', '<c-j>', '<c-w><c-j>', { noremap = true })
vim.api.nvim_set_keymap('n', '<c-k>', '<c-w><c-k>', { noremap = true })
vim.api.nvim_set_keymap('n', '<c-l>', '<c-w><c-l>', { noremap = true })

-- Buffer switching
vim.api.nvim_set_keymap('n', '<leader>n', '<cmd>BufferLineCyclePrev<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>m', '<cmd>BufferLineCycleNext<cr>', { noremap = true })
vim.api.nvim_set_keymap('i', '<leader>n', '<cmd>BufferLineCyclePrev<cr>', { noremap = true })
vim.api.nvim_set_keymap('i', '<leader>m', '<cmd>BufferLineCycleNext<cr>', { noremap = true })

-- Search
vim.api.nvim_set_keymap('n', '<leader>/', ':nohlsearch<cr>', { noremap = true, silent = true })

-- Telescope
vim.api.nvim_set_keymap('n', '<leader>fj', '<cmd>Telescope git_files<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', { noremap = true, silent = true })

-- Lsp
vim.api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<c-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', { noremap = true, silent = true })

-- File Explorer
vim.api.nvim_set_keymap('n', '<c-n>', '<cmd>NvimTreeToggle<cr>', {noremap = true})

