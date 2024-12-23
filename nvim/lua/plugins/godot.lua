-- local ok, godot = pcall(require, "vim-godot")
-- if not ok then
--   require("notify")("Godot plugin not found")
--   return
-- end


-- default config
-- local config = {
--   bin = "/usr/bin/godot",
-- 	gui = {
-- 		console_config = @config for vim.api.nvim_open_win
-- 	},
-- }
-- godot.setup(config)
-- local u = require('helper_funcs')
--
-- local function map(m, k, v)
--   vim.keymap.set(m, k, v, { silent = true })
-- end
--
-- u.create_augroup('godot', {
--   { 'FileType', 'godot,gd', 'map("n", "<leader>dr", godot.debugger.debug)           ' },
--   { 'FileType', 'godot,gd', 'map("n", "<leader>dd", godot.debugger.debug_at_cursor) ' },
--   { 'FileType', 'godot,gd', 'map("n", "<leader>dq", godot.debugger.quit)            ' },
--   { 'FileType', 'godot,gd', 'map("n", "<leader>dc", godot.debugger.continue)        ' },
--   { 'FileType', 'godot,gd', 'map("n", "<leader>ds", godot.debugger.step)            ' },
-- })

local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true }
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>",
  --     "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gr",
    "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gl",
    '<cmd>lua vim.diagnostic.open_float({ border = "rounded" })<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>[",
    '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded", float = true })<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>]",
    '<cmd>lua vim.diagnostic.goto_next({ border = "rounded", float = true })<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

local function on_attach(client, bufnr)
  require("lsp-format").on_attach(client)
  lsp_keymaps(bufnr)
  -- lsp_highlight_document(client)
end

require 'lspconfig'.gdscript.setup {
  capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
  on_attach = on_attach
}
