-- General helpers
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Leader
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Save
keymap("n", "<leader>w", "<cmd>update<cr>", opts)
keymap("v", "<leader>w", "<c-c><cmd>update<cr>", opts)
keymap("i", "<leader>w", "<c-o><cmd>update<cr>", opts)

-- Quit
keymap("n", "<leader>q", "<cmd>bd<cr>", opts)
keymap("n", "<leader>Q", "<cmd>qa<cr>", opts)

-- Windows
keymap("n", "<c-h>", "<c-w><c-h>", opts)
keymap("n", "<c-j>", "<c-w><c-j>", opts)
keymap("n", "<c-k>", "<c-w><c-k>", opts)
keymap("n", "<c-l>", "<c-w><c-l>", opts)

-- Buffer switching
keymap("n", "<leader>n", "<cmd>BufferLineCyclePrev<cr>", opts)
keymap("n", "<leader>m", "<cmd>BufferLineCycleNext<cr>", opts)
keymap("i", "<leader>n", "<cmd>BufferLineCyclePrev<cr>", opts)
keymap("i", "<leader>m", "<cmd>BufferLineCycleNext<cr>", opts)

-- Search
keymap("n", "<leader> ", ":nohlsearch<cr>", opts)

-- Keep indent
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
