--[[ General settings ]]--
vim.g.mapleader = ','
vim.g.backup = false
vim.g.writebackup = false

vim.o.mouse = 'a'		-- use mouse
vim.o.clipboard = 'unnamedplus' -- use system clipboard

vim.wo.number = true		-- use linenumbers
vim.wo.signcolumn = 'yes'	-- always keep sign column

vim.cmd('colorscheme dracula')
vim.o.termguicolors = true	-- required to make theme look good

vim.o.expandtab = true		-- Use spaces instead of tabs
vim.wo.wrap = false		-- Don't wrap lines

vim.o.tabstop = 4 
vim.o.shiftwidth = vim.o.tabstop


-- TODO: check if this can be rewritten differently
result = vim.api.nvim_exec(
[[
" Searching
nnoremap <space>         /
nnoremap <leader><space> :nohlsearch<CR>

" LSP settings
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>

" Telescope specific keymaps
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fj <cmd>Telescope git_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

""" Completion
" Use completion-nvim in every buffer
autocmd BufEnter * lua require'completion'.on_attach()

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c
]],
true)

