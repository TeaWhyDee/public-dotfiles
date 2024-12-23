local u = require('helper_funcs')


if vim.env.TERM == 'xterm-kitty' or vim.env.TERM == 'kitty' then
  vim.cmd([[autocmd UIEnter * if v:event.chan ==# 0 | call chansend(v:stderr, "\x1b[>1u") | endif]])
  vim.cmd([[autocmd UILeave * if v:event.chan ==# 0 | call chansend(v:stderr, "\x1b[<1u") | endif]])
end

local o = vim.o
local wo = vim.wo
local bo = vim.bo
local cmd = vim.cmd


-- {{{ CMDs
cmd('filetype plugin on')
cmd [[
  let g:tex_conceal=""
]]
-- }}}

-- {{{ VARs
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'
-- }}}

-- {{{ SETs
bo.expandtab = true
o.hidden = true
o.swapfile = false
o.undofile = true
o.cursorline = true
o.number = true
o.relativenumber = true
o.signcolumn = "yes"
o.mouse = "a"
o.so = 10
o.wildmenu = true
o.termguicolors = true
-- o.foldmethod = "marker"

-- UFO
o.foldmethod = "manual"
o.foldcolumn = '0' -- 0 or 1
o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
o.foldlevelstart = 99
o.foldenable = true
-- /UFO

o.wrap = false

o.ignorecase = true
o.smartcase = true
o.hlsearch = true
o.incsearch = true
o.lazyredraw = false

o.autoread = true
o.history = 1000
o.backup = false
o.writebackup = false
o.cmdheight = 1

o.smarttab = true -- tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
o.tabstop = 4 -- the visible width of tabs
o.softtabstop = 2 -- edit as if the tabs are 4 characters wide
o.expandtab = true -- spaces instead of tabs
o.shiftwidth = 4 -- number of spaces to use for indent and unindent
o.shiftround = true -- round indent to a multiple of 'shiftwidth'

o.splitbelow = true
o.virtualedit = "block"
o.updatetime = 200
o.smoothscroll = true
-- }}}

-- AUGROUPs {{{
cmd('au BufNewFile,BufRead * if &ft == "" | set ft=text | endif')


-- u.create_augroup('packer_user_config', {
--   { 'BufWritePost', 'plugins.lua', 'source <afile> | PackerCompile' }
-- })

u.create_augroup('filetype', {
  { 'BufWritePost', 'plugins.lua', 'source <afile> | PackerCompile' },
  { 'FileType', 'md,markdown,vimwiki', 'setlocal foldmethod=marker' },
  { 'FileType', 'md,markdown,vimwiki', 'setlocal wrap' },
  { 'FileType', 'md,markdown,vimwiki', 'setlocal linebreak' },

  { 'FileType', 'tex,markdown,vimwiki', 'let conceallevel=1' },
  { 'FileType', 'json', 'set conceallevel=0' },
  { 'FileType', 'lua', 'set shiftwidth=2' },
  { 'FileType', 'taskreport,vimwiki', 'set norelativenumber' },
  { 'FileType', 'taskreport,vimwiki', 'set nonumber' },
  -- { 'FileType', 'vimwiki', 'set textwidth=60' },
  -- { 'FileType', 'md,markdown,vimwiki', 'let b:indentLine_enabled = 0' },
  -- { 'FileType', 'md,markdown,vimwiki', 'IndentBlanklineDisable' },
  { 'FileType', 'md,markdown,vimwiki', 'set concealcursor=' },
})

u.create_augroup('other', {
  { 'BufRead', '**/encrypted/vimwiki/*.wiki', 'set textwidth=80' },
  { 'BufRead', '**/encrypted/vimwiki/*.md', 'set textwidth=80' }
})

u.create_augroup('skeletons', {
  { 'BufNewFile', '*.tex', '0r ~/.config/nvim/templates/skeleton.tex' },
  -- { 'BufNewFile', '**/diary/*.md', '0r ~/.config/nvim/templates/diary.md' }
})

-- }}}
