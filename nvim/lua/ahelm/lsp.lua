--[[ LSP config ]]--
require'lspconfig'.pyright.setup{on_attach=require'completion'.on_attach}
require'lspconfig'.vimls.setup{}
require'lspconfig'.bashls.setup{}
require'lspconfig'.clangd.setup{}
