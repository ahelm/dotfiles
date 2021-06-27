--[[ LSP config ]]--
require'lspconfig'.pyright.setup{
  on_attach=require'completion'.on_attach,
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "off"
      }
    }
  }
}
require'lspconfig'.vimls.setup{}
require'lspconfig'.bashls.setup{}
require'lspconfig'.clangd.setup{}
require'lspconfig'.rust_analyzer.setup{}

