local status_ok, ufo = pcall(require, "ufo")
if not status_ok then
  require("notify")("Couldn't load ufo")
  return
end

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.foldingRange = {
--     dynamicRegistration = false,
--     lineFoldingOnly = true
-- }
-- local language_servers = require("lspconfig").util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
-- for _, ls in ipairs(language_servers) do
--     require('lspconfig')[ls].setup({
--         capabilities = capabilities
--         -- you can add other fields for setting up lsp server in this table
--     })
-- end
-- require('ufo').setup()


-- performance and stability are better than `foldmethod=nvim_treesitter#foldexpr()`
ufo.setup({
    provider_selector = function(bufnr, filetype, buftype)
        return {'treesitter', 'indent'}
    end
})

vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
