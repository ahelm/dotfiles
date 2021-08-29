--[[ General settings ]]--
vim.opt_global.backup = false
vim.opt_global.writebackup = false

vim.opt_global.mouse = 'a'		 -- use mouse
vim.opt_global.clipboard = 'unnamedplus' -- use system clipboard

vim.wo.number = true		 -- use linenumbers
vim.wo.signcolumn = 'yes'	 -- always keep sign column

vim.cmd('colorscheme dracula')
vim.opt.termguicolors = true	 -- required to make theme look good

vim.opt.expandtab = true		 -- Use spaces instead of tabs
vim.wo.wrap = false		 -- Don't wrap lines

vim.opt.tabstop = 2
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- no swapfiles
vim.opt_local.swapfile = false

-- TODO: check if this can be rewritten differently
result = vim.api.nvim_exec(
[[
""" Spelling checks
augroup gitCommitSpell
    autocmd!
    autocmd FileType COMMIT_EDITMSG setlocal spell
    autocmd BufRead,BufNewFile COMMIT_EDITMSG setlocal spell
augroup END

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

