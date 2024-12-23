local status_ok, formatter = pcall(require, "formatter")
if not status_ok then
  require("notify")("No formatter.nvim")
  return
end

local util = require "formatter.util"

formatter.setup {
-- Enable or disable logging
  logging = true,
  -- Set the log level
  log_level = vim.log.levels.DEBUG,
  -- All formatter configurations are opt-in
  filetype = {
    -- Formatter configurations for filetype "lua" go here
    -- and will be executed in order
    lua = {
      -- "formatter.filetypes.lua" defines default configurations for the
      -- "lua" filetype
      require("formatter.filetypes.lua").stylua,

    },

    -- python = {
    --     require("formatter.filetypes.python").autoflake,
    -- },

    -- ["*"] = {
    --   require("formatter.filetypes.any").remove_trailing_whitespace
    -- }
  }
}
