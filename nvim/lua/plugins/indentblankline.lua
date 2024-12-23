local status_ok, indentblankline = pcall(require, "indent_blankline")

if not status_ok then
  require("notify")("Blankline plugin not found")
  return
end

vim.opt.list = true
-- vim.opt.listchars:append "space:⋅"
-- vim.opt.listchars:append "eol:↴"
-- vim.cmd [[highlight IndentBlanklineIndent1 guibg=#1f1f1f gui=nocombine]]
vim.cmd [[highlight IndentBlanklineContextChar guifg=#885577 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent2 guibg=#1a1a1a gui=nocombine]]

indentblankline.setup {
  space_char_blankline = " ",
  show_current_context = true,
  show_current_context_start = false,

  -- char_highlight_list = {
      -- "IndentBlanklineIndent1",
      -- "IndentBlanklineIndent2",
  -- },
  -- space_char_highlight_list = {
  --     "IndentBlanklineIndent1",
  --     "IndentBlanklineIndent2",
  -- },
}



















