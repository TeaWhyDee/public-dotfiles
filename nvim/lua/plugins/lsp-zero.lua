local lsp = require('lsp-zero').preset('minimal')


local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "" },
  { name = "DiagnosticSignInfo", text = "" },
}
local config = {
  -- disable virtual text
  virtual_text = false,
  --   {
  --   spacing = 4,
  --   severity = vim.diagnostic.severity.ERROR
  -- },
  -- show signs
  signs = {
    active = signs,
  },
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
}
vim.diagnostic.config(config)

local function lsp_keymaps(bufnr)
  local opts = { buffer = bufnr, noremap = true, silent = true }
  vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { buffer = bufnr })
  vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { buffer = bufnr })
  vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { buffer = bufnr })
  vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { buffer = bufnr })
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>",
  --     "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { buffer = bufnr })
  vim.keymap.set("n", "<leader>a", "<cmd>lua vim.lsp.buf.code_action()<CR>", { buffer = bufnr })
  vim.keymap.set("n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", { buffer = bufnr })

  vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { buffer = bufnr })
  vim.keymap.set("n", "gl", '<cmd>lua vim.diagnostic.open_float({ border = "rounded" })<CR>', { buffer = bufnr })
  vim.keymap.set("n", "<leader>[", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded", float = true })<CR>',
    { buffer = bufnr })
  vim.keymap.set("n", "<leader>]", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded", float = true })<CR>',
    { buffer = bufnr })
  vim.keymap.set("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", { buffer = bufnr })

  -- vim.cmd [[ command! Format execute 'lua vim.lsp.buf.format()' ]]
  vim.keymap.set({ 'n', 'x' }, 'gq', function()
    vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
  end, opts)
end


-- see :help lsp-zero-keybindings
lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({ buffer = bufnr })

  lsp_keymaps(bufnr)
end)


-- lsp.ensure_installed({
-- Replace these with whatever servers you want to install
--   'rust_analyzer',
-- })


require('mason').setup({})
require('mason-lspconfig').setup({
  -- Replace the language servers listed here
  -- with the ones you want to install
  ensure_installed = { 'tsserver', 'rust_analyzer' },
  handlers = {
    lsp.default_setup,
  },
})



require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

-- require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
-- require('lspconfig').minimal

require('lspconfig').eslint.setup({
  single_file_support = false,
  on_attach = function(client, bufnr)
    print('hello eslint')
  end
})

lsp.setup()
