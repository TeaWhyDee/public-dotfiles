local status_ok, conform = pcall(require, "conform")
if not status_ok then
  require("notify")("No conform")
  return
end


conform.setup({
  formatters = {
    black = {
      command = "black",
      args = {
        "--line-length",
        "80",
        "--stdin-filename",
        "$FILENAME",
        "--quiet",
        "-",
      },
    }
  },
  formatters_by_ft = {
    lua = { "stylua" },
    -- Conform will run multiple formatters sequentially
    -- python = { "black", "autoflake" },
    python = { "black" },
    -- Use a sub-list to run only the first available formatter
    javascript = { { "prettierd", "prettier" } },
  },
})


vim.cmd [[ command! Format execute 'lua require("conform").format()' ]]


-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = "*",
--   callback = function(args)
--     require("conform").format({ bufnr = args.buf })
--   end,
-- })
--
