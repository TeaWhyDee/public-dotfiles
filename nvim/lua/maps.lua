local cmd = vim.cmd
require('helper_funcs')
-- {{{ map funcs
local function map(kind, key, maps, opts)
  vim.keymap.set(kind, key, maps, opts)
end

local function nno(key, maps, desc)
  map('n', key, maps, { noremap = true, silent = true, desc = desc })
end

local function nmap(key, maps, desc)
  map('n', key, maps, { noremap = false, silent = true, desc = desc })
end

local function ino(key, maps, desc)
  map('i', key, maps, { noremap = true, silent = true, desc = desc })
end

-- local function imap(key, maps, desc)
--   map('i', key, maps, {noremap=false, silent=true, desc=desc})
-- end
-- local function lnno(key, maps, desc)
--   map('n', key, maps, {noremap=true, desc=desc})
-- end
-- local function lvno(key, maps, desc)
--   map('v', key, maps, {noremap=true, desc=desc})
-- end
local function vno(key, maps, desc)
  map('v', key, maps, { noremap = true, silent = true, desc = desc })
end

local function vmap(key, maps, desc)
  map('v', key, maps, { noremap = false, silent = true, desc = desc })
end

local function tno(key, maps, desc)
  map('t', key, maps, { noremap = true, silent = true, desc = desc })
end

local function ono(key, maps, desc)
  map('o', key, maps, { noremap = true, silent = true, desc = desc })
end

--[[ local function cabbr(key, maps)
  vim.cmd('cabbrev '..key..' '..maps)
end ]]
-- local function command(cmd, bin, opt)
--   vim.api.nvim_create_user_command(cmd, bin, opt or {})
-- end
-- local function get_config(name)
--   return string.format('require("config.%s")', name)
-- end
-- local function get_setup(name, conf)
--   return string.format('require"%s".setup%s', name, vim.inspect(conf or {}))
-- end
-- local function autocmd(au, opt)
--   vim.api.nvim_create_autocmd(au, opt)
-- end
-- }}}
-- {{{ CMDs
cmd("command! Scratch lua require'tools'.makeScratch()")
cmd('command! -nargs=0 VimuxRerun :call VimuxRerun()<CR>')
local remap = { 'WQA', 'WQa', 'Wqa', 'WQ', 'Wq', 'QA', 'Qa', 'W', 'Q' }
for _, i in ipairs(remap) do
  cmd('ca ' .. i .. ' ' .. string.lower(i))
  cmd('ca ' .. i .. '! ' .. string.lower(i) .. '!')
end
cmd('ca n new')
-- }}}

-- MAPS
-- {{{ OPERATORS
ono('A', '$')
ono('v', ':<C-U>call SelWithDot()<CR>')
-- }}}

-- {{{ NORMAL
-- nno('<Space>',    '')
nno('<Space>', '<Nop>')
nno('j', 'gj')
nno('k', 'gk')
nno('gj', 'j')
nno('gk', 'k')
nno('n', 'nzzzv')
nno('N', 'Nzzzv')
nno('<A-e>', ':eCR>')
nno('<A-j>', ': m .+1<CR>==')
nno('<A-k>', ': m .-2<CR>==')
nno('<C-j>', '<C-w>j')
nno('<C-k>', '<C-w>k')
nno('<C-l>', '<C-w>l')
nno('<C-h>', '<C-w>h')
nno('<A-o>', 'Jo')
nno('<leader>;', 'm`A;<Esc>``')
nno('<Up>', ': resize -2<CR>')
nno('<Down>', ': resize +2<CR>')
nno('<Left>', ': vertical resize +2<CR>')
nno('<Right>', ': vertical resize -2<CR>')
nno('<Leader>dg', ':diffget<CR>')
nno('<Leader>dp', ':diffput<CR>')
nno('<Leader>du', ':diffupdate<CR>')
nno('<Leader>dt', ':diffthis<CR>')
nno('<Leader>dd', ':diffoff<CR>')
nno('<Leader>wg', ':!python ~/gh/TWD-Website-src/python/main.py<CR>')
nno('<Leader>sc', ':set conceallevel=1<CR>')
nno('<Leader>sC', ':set conceallevel=0<CR>')
nno('<Leader>n', ':new<CR>')
nno('<Leader>p', ':read !nvimpaste.sh<CR>')
nno('<Leader>P', ':ProjectRoot<CR>')
nno('<Leader>%', ':cd %:h<CR>')
nno('<Leader>..', ':cd ..<CR>')
nno('<Leader>g', ':Gitsigns ')
nno('<Leader>gt', ':Gitsigns toggle_numhl<CR>')
nno('<Leader>gb', ':Gitsigns blame_line<CR>')
nno('<Leader>gp', ':Gitsigns preview_hunk<CR>')
nno('<Leader>gh', ':Gitsigns preview_hunk<CR>')
nno('<Leader>gn', ':Gitsigns next_hunk<CR>')
nno('<Leader>gN', ':Gitsigns prev_hunk<CR>')
-- paste / write / insert
nno('<Leader>id', ':r !date_formatted<CR>')
nno('<Leader>it', ':r !time_now<CR>')



nno('<A-r>', ':so ~/.config/nvim/init.lua<CR>')
nno('<C-s>', ':w<CR>')
-- nno('<C-y>', ':call Save()<CR>')
nno('Y', 'y$')
nno('<Leader>yd', ':let @+ = expand("%:p:h")<CR>')
nno('<Leader>yf', ':let @+ = expand("%:t:r")<CR>')
nno('i', ':noh<CR>i')
nno('a', ':noh<CR>a')
nno('<Leader>zf', 'zfi{')
nmap('<M-]>', '<c-i>')
nmap('<M-[>', '<c-o>')
nno('tN', ':tabnew<CR>')
nno('tn', ':tabnext<CR>')
nno('tp', ':tabprevious<CR>')
nno('tb', ':tabprevious<CR>')
nno('td', ':tabclose<CR>')
nno('tl', ':+tabmove<CR>')
nno('th', ':-tabmove<CR>')
nno('<Tab>', ':Telescope buffers<CR>')
nno('<f1>', ':Telescope find_files<CR>')
nno('<leader>fc', ':Telescope live_grep<CR>')
nno('<leader>fC', ":lua require'telescope.builtin'.grep_string()<CR>")
nno('<leader>fp', ':Telescope projects<CR>')
nno('<leader>fh', ':Telescope oldfiles<CR>')
nno('<leader>fg', ':Telescope oldfiles<CR>')

nno('zl', '6zl')
nno('zh', '6zh')

nno('<Leader>rf', ':Ranger<CR>')
nno('<Leader>rF', ':RangerWorkingDirectory<CR>')
nno('<Leader>rs', ':Startify<CR>')
nno('<Leader>rc', ':Calendar<CR>')
nno('<Leader>rt', ':Tagbar<CR>')
nno('<Leader>jp', ':echo jobstart("mpv --force-window --geometry=400x400-10-10 --no-resume-playback idle=once " . expand("<cWORD>"))<CR>', "play cWORD with mpv")
nno('<Leader>jl', ':echo jobstart("latexmk -pvc -pdf " . expand("%"))<CR>', 'latex make')
nno('<Leader>jx', ':echo jobstart("xdg-open " . expand("<cWORD>"))<CR>', 'run with xdg-open')
nno('x', '"_x')
-- nno('<F5>',       ':call CurtineIncSw()<CR>')
nno('<Leader>gf', ':call GoFile(expand("<cfile>:p"), expand("<cfile>:h"))<CR>')
-- nmap('<A-b>',      'siW2*')
cmd("nmap <A-b> siW2*")
-- }}}

-- {{{ INSERT
ino('<A-j>', '<Esc> : m .+1<CR>==gi')
ino('<A-k>', '<Esc> : m .-2<CR>==gi')
ino('<A-Tab>', '<Tab>')
-- imap('<A-b>', '<Esc>siW2*Ea')
cmd("imap <a-b> siW2*")
-- }}}

-- {{{ VISUAL
vno('<A-j>', ": m '>+1<CR>gv=gv")
vno('<A-k>', ": m '<-2<CR>gv=gv")
vno('<Leader>yy', '"+yy')
vno('<Leader>y', '"+y')
vno('<expr>y', '"my\"" . v:register . "y`y"')
vno('>', '>gv')
vno('<', '<gv')
vno('A', '$')
-- vno('n', 'nzzzv')
vno('N', 'Nzzzv')
vmap(',', '<gv')
vmap('.', '>gv')
-- " vnoremap <A-l>       dlp
-- " vnoremap <A-h>       dhph
-- vmap ('<A-b>', 'S*gvS*')
-- }}}

-- {{{ Indent Jumping
nno('[l', ':call NextIndent(0, 0, 1, 1)<CR>')
nno(']l', ':call NextIndent(0, 1, 1, 1)<CR>')
nno('[L', ':call NextIndent(0, 0, 0, 1)<CR>')
nno(']L', ':call NextIndent(0, 1, 0, 1)<CR>')

ono('[l', ':call NextIndent(1, 0, 1, 1)<CR>')
ono(']l', ':call NextIndent(1, 1, 1, 1)<CR>')
ono('[L', ':call NextIndent(0, 0, 0, 1)<CR>')
ono(']L', ':call NextIndent(0, 1, 0, 1)<CR>')
-- }}}

tno('<A-h>', '<C-\\><C-N><C-w>h')
tno('<A-j>', '<C-\\><C-N><C-w>j')
tno('<A-k>', '<C-\\><C-N><C-w>k')
tno('<A-l>', '<C-\\><C-N><C-w>l')

-- {{{ Russian
nmap('й', 'q')
nmap('ц', 'w')
nmap('у', 'e')
nmap('к', 'r')
nmap('е', 't')
nmap('н', 'y')
nmap('г', 'u')
nmap('ш', 'i')
nmap('щ', 'o')
nmap('з', 'p')
nmap('х', '[')
nmap('ъ', ']')
nmap('ф', 'a')
nmap('ы', 's')
nmap('в', 'd')
nmap('а', 'f')
nmap('п', 'g')
nmap('р', 'h')
nmap('о', 'j')
nmap('л', 'k')
nmap('д', 'l')
nmap('я', 'z')
nmap('ч', 'x')
nmap('с', 'c')
nmap('м', 'v')
nmap('и', 'b')
nmap('т', 'n')
nmap('ь', 'm')

nmap('Й', 'Q')
nmap('Ц', 'W')
nmap('У', 'E')
nmap('К', 'R')
nmap('Е', 'T')
nmap('Н', 'Y')
nmap('Г', 'U')
nmap('Ш', 'I')
nmap('Щ', 'O')
nmap('З', 'P')
nmap('Х', '{')
nmap('Ъ', '}')
nmap('Ф', 'A')
nmap('Ы', 'S')
nmap('В', 'D')
nmap('А', 'F')
nmap('П', 'G')
nmap('Р', 'H')
nmap('О', 'J')
nmap('Л', 'K')
nmap('Д', 'L')
nmap('Я', 'Z')
nmap('Ч', 'X')
nmap('С', 'C')
nmap('М', 'V')
nmap('И', 'B')
nmap('Т', 'N')
nmap('Ь', 'M')
-- }}}
