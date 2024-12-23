local status_ok, luasnip = pcall(require, "luasnip")
if not status_ok then
  require("notify")("luasnip not found")
  return
end


luasnip.setup({
  region_check_events = "CursorHold,InsertLeave",
  -- those are for removing deleted snippets, also a common problem
  delete_check_events = "TextChanged,InsertEnter",
})
