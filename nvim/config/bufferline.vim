set termguicolors
lua << END
require('bufferline').setup {
  options = {
    -- numbers = "none" | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
    --- @deprecated, please specify numbers as a function to customize the styling
    -- number_style = "superscript" | "subscript" | "" | { "none", "subscript" }, -- buffer_id at index 1, ordinal at index 2
    close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"
    right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
    left_mouse_command = "buffer %d",    -- can be a string | function, see "Mouse actions"
    middle_mouse_command = nil,          -- can be a string | function, see "Mouse actions"
    -- NOTE: this plugin is designed with this icon in mind,
    -- and so changing this is NOT recommended, this is intended
    -- as an escape hatch for people who cannot bear it for whatever reason
    -- indicator.icon = '▎',
    -- indicator.style = ""
    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '<',
    right_trunc_marker = ' >',
    --- name_formatter can be used to change the buffer's label in the bufferline.
    --- Please note some names can/will break the
    --- bufferline so use this at your discretion knowing that it has
    --- some limitations that will *NOT* be fixed.
    name_formatter = function(buf)  -- buf contains a "name", "path" and "bufnr"
      -- remove extension from markdown files for example
      if buf.name:match('%.md') then
        return vim.fn.fnamemodify(buf.name, ':t:r')
      end
    end,
    max_name_length = 18,
    max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
    tab_size = 8,
    diagnostics = "coc",
    -- diagnostics = false | "nvim_lsp" | "coc",
    -- diagnostics_update_in_insert = false,
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      if (count == 1) then return "⓪"
      elseif (count == 1) then return "①"
      elseif (count == 2) then return "②"
      elseif (count == 3) then return "③"
      elseif (count == 4) then return "④"
      elseif (count == 5) then return "⑤"
      elseif (count == 6) then return "⑥"
      elseif (count == 7) then return "⑦"
      elseif (count == 8) then return "⑧"
      elseif (count == 9) then return "⑨"
      elseif (count == 10) then return "⑩ "
      elseif (count == 11) then return "⑪ "
      elseif (count == 12) then return "⑫ "
      elseif (count == 13) then return "⑬ "
      elseif (count == 14) then return "⑭ "
      elseif (count == 15) then return "⑮ "
      elseif (count == 16) then return "⑯ "
      elseif (count == 17) then return "⑰ "
      elseif (count == 18) then return "⑱ "
      elseif (count == 19) then return "⑲ "
      elseif (count == 20) then return "⑳ "
      elseif (count == 21) then return "㉑"
      elseif (count == 22) then return "㉒"
      elseif (count == 23) then return "㉓"
      elseif (count == 24) then return "㉔"
      elseif (count == 25) then return "㉕"
      elseif (count == 26) then return "㉖"
      elseif (count == 27) then return "㉗"
      elseif (count == 28) then return "㉘"
      elseif (count == 29) then return "㉙"
      elseif (count == 30) then return "㉚"
      elseif (count == 31) then return "㉛"
      elseif (count == 32) then return "㉜"
      elseif (count == 33) then return "㉝"
      elseif (count == 34) then return "㉞"
      elseif (count == 35) then return "㉟"
      elseif (count == 36) then return "㊱"
      elseif (count == 37) then return "㊲"
      elseif (count == 38) then return "㊳"
      elseif (count == 39) then return "㊴"
      elseif (count == 40) then return "㊵"
      elseif (count == 41) then return "㊶"
      elseif (count == 42) then return "㊷"
      elseif (count == 43) then return "㊸"
      elseif (count == 44) then return "㊹"
      elseif (count == 45) then return "㊺"
      elseif (count == 46) then return "㊻"
      elseif (count == 47) then return "㊼"
      elseif (count == 48) then return "㊽"
      elseif (count == 49) then return "㊾"
      elseif (count == 50) then return "㊿" end
      return "!"..count
    end,
    -- NOTE: this will be called a lot so don't do any heavy processing here
    -- custom_filter = function(buf_number)
      -- filter out filetypes you don't want to see
      -- if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
        -- return true
      -- end
      -- filter out by buffer name
      -- if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
        -- return true
      -- end
      -- filter out based on arbitrary rules
      -- e.g. filter out vim wiki buffer from tabline in your work repo
      -- if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
        -- return true
      -- end
    -- end,
    offsets = {{ filetype = "NvimTree", text = "File Explorer", text_align = "left" or "center" or "right" }},
    show_buffer_icons = true, -- disable filetype icons for buffers
    show_buffer_close_icons = true,
    show_close_icon = false,
    show_tab_indicators = true,
    -- persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    -- can also be a table containing 2 custom separators
    -- [focused and unfocused]. eg: { '|', '|' }
    -- separator_style = "slant" | "thick" | "thin" | { 'any', 'any' },
    separator_style = "thin",
    enforce_regular_tabs = false,
    always_show_bufferline = false,
    -- -- sort_by = 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
      -- add custom logic
      -- return buffer_a.modified > buffer_b.modified
    -- end
  }
}
END
" map <A-H> <Plug>vem_move_buffer_left-
" map <A-L> <Plug>vem_move_buffer_right-
" nmap <A-h> <Plug>vem_prev_buffer-
" nmap <A-l> <Plug>vem_next_buffer-
unmap L
unmap H
nnoremap <silent>L :BufferLineCycleNext<CR>
nnoremap <silent>H :BufferLineCyclePrev<CR>

nnoremap <silent><A-L> :BufferLineMoveNext<CR>
nnoremap <silent><A-H> :BufferLineMovePrev<CR>

nnoremap <silent><leader>1 <Cmd>BufferLineGoToBuffer 1<CR>
nnoremap <silent><leader>2 <Cmd>BufferLineGoToBuffer 2<CR>
nnoremap <silent><leader>3 <Cmd>BufferLineGoToBuffer 3<CR>
nnoremap <silent><leader>4 <Cmd>BufferLineGoToBuffer 4<CR>
nnoremap <silent><leader>5 <Cmd>BufferLineGoToBuffer 5<CR>
nnoremap <silent><leader>6 <Cmd>BufferLineGoToBuffer 6<CR>
nnoremap <silent><leader>7 <Cmd>BufferLineGoToBuffer 7<CR>
nnoremap <silent><leader>8 <Cmd>BufferLineGoToBuffer 8<CR>
nnoremap <silent><leader>9 <Cmd>BufferLineGoToBuffer 9<CR>
