local status_ok, sts = pcall(require, "syntax-tree-surfer")
if not status_ok then
  require("notify")("syntax-tree-surfer plugin load failed")
  return
end
local opts = { noremap = true, silent = true }

vim.keymap.set("n", "gfu", function() -- only jump to functions
  sts.targeted_jump({ "function", "arrrow_function", "function_definition" })
  --> In this example, the Lua language schema uses "function",
  --  when the Python language uses "function_definition"
  --  we include both, so this keymap will work on both languages
end, opts)

local list = {
  "function",
  "arrow_function",
  "function_definition",
  "if_statement",
  "else_clause",
  "else_statement",
  "elseif_statement",
  "elif_statement",
  "for_statement",
  "while_statement",
  "switch_statement",
  "class_definition",
}



-- jump to parent or child nodes only
vim.keymap.set("n", "_", function()
  sts.filtered_jump(list, false, { destination = "parent" })
end, opts)

vim.keymap.set("n", "+", function()
  sts.filtered_jump(list, true, { destination = "children" })
end, opts)

vim.keymap.set("n", "=", function()
  sts.filtered_jump(list, true, { destination = "siblings" })
end, opts)

vim.keymap.set("n", "-", function()
  sts.filtered_jump(list, false, { destination = "siblings" })
end, opts)

-- Setup Function example:
-- These are the default options:
sts.setup({
  highlight_group = "STS_highlight",
  disable_no_instance_found_report = false,
  default_desired_types = {
    "function",
    "arrow_function",
    "function_definition",
    "if_statement",
    "else_clause",
    "else_statement",
    "elseif_statement",
    "for_statement",
    "while_statement",
    "switch_statement",
    "class_definition",
  },
  left_hand_side = "fdsawervcxqtzb",
  right_hand_side = "jkl;oiu.,mpy/n",
  icon_dictionary = {
    ["if_statement"] = "",
    ["else_clause"] = "",
    ["else_statement"] = "",
    ["elseif_statement"] = "",
    ["for_statement"] = "ﭜ",
    ["while_statement"] = "ﯩ",
    ["switch_statement"] = "ﳟ",
    ["function"] = "",
    ["function_definition"] = "",
    ["variable_declaration"] = "",
  },
})
