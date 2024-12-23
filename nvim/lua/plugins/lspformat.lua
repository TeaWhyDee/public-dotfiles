local status_ok, lspformat = pcall(require, "lsp-format")
if not status_ok then
  require("notify")("lsp-format not found")
  return
end

lspformat.setup {
  -- typescript = {
  --       tab_width = function()
  --           return vim.opt.shiftwidth:get()
  --       end,
  --   },
  --   yaml = { tab_width = 2 },
}
local prettier = {
  formatCommand = [[prettier --stdin-filepath ${INPUT} ${--tab-width:tab_width}]],
  formatStdin = true,
}
-- require("lspconfig").efm.setup {
--     on_attach = require("lsp-format").on_attach,
--     init_options = { documentFormatting = true },
--     settings = {
--         languages = {
--             typescript = { prettier },
--             yaml = { prettier },
--         },
--     },
-- }
