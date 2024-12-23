lua << END
require('lualine').setup{
options = {
    icons_enabled = true,
    --theme = 'nightfly',
    theme = 'dracula',
    -- theme = 'codedark',
    component_separators = { left = '|', right = '|'},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    },
sections = {
    lualine_a = {'branch'},
    lualine_b = {{'diagnostics', sources={'nvim_lsp', 'coc'}}},
    lualine_c = {{
    'filename',
    path = 1
    }},
lualine_x = {'encoding', 'filetype'},
lualine_y = {'progress'},
lualine_z = {'location'}
},
inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
    },
tabline = {},
extensions = {},
}
END
