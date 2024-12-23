let g:airline_mode_map = {
    \ '__'     : '-',
    \ 'c'      : 'C',
    \ 'i'      : 'I',
    \ 'ic'     : 'I',
    \ 'ix'     : 'I',
    \ 'n'      : 'N',
    \ 'multi'  : 'M',
    \ 'ni'     : 'N',
    \ 'no'     : 'N',
    \ 'R'      : 'R',
    \ 'Rv'     : 'R',
    \ 's'      : 'S',
    \ 'S'      : 'S',
    \ ''     : 'S',
    \ 't'      : 'T',
    \ 'v'      : 'V',
    \ 'V'      : 'V',
    \ ''     : 'V',
    \ }

" let g:airline_section_a       (mode, crypt, paste, spell, iminsert)
" let g:airline_section_b       (hunks, branch)[*]
" let g:airline_section_c       (bufferline or filename, readonly)
" let g:airline_section_gutter  (csv)
" let g:airline_section_x       (tagbar, filetype, virtualenv)
" let g:airline_section_y       (fileencoding, fileformat, 'bom', 'eol')
" let g:airline_section_z = (percentage, line number, column number)
" let g:airline_section_error   (ycm_error_count, syntastic-err, eclim, languageclient_error_count)
" let g:airline_section_warning (ycm_warning_count, syntastic-warn,

let g:airline_theme='owo'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#ctrlspace#enabled = 1
let g:airline_exclude_preview = 1
let g:CtrlSpaceStatuslineFunction = "airline#extensions#ctrlspace#statusline()"

" let g:airline#extensions#tabline#buffer_min_count = 0
" let g:airline#extensions#tabline#tab_min_count = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#keymap_ignored_filetypes = ['vimfiler', 'nerdtree']
let g:airline#extensions#tabline#fnametruncate = 10
let g:airline#extensions#tabline#middle_click_preserves_windows = 1
let g:airline#extensions#tabline#excludes = []
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tabline#buffers_label = 'b'
let g:airline#extensions#tabline#tabs_label = 't'
let g:airline#extensions#tabline#overflow_marker = '…'
let g:airline#extensions#tabline#show_buffers = 0
" let g:airline#extensions#tabline#switch_buffers_and_tabs = 1
" let g:airline#extensions#scrollbar#enabled = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.colnr = ''
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = ' '
let g:airline_symbols.maxlinenr = ':'
let g:airline_symbols.branch = ''
let g:airline_symbols.paste = ''
let g:airline_symbols.spell = ''
let g:airline_symbols.notexists = ''
let g:airline_symbols.whitespace = ''

nmap <A-h> <Plug>AirlineSelectPrevTab
nmap <A-l> <Plug>AirlineSelectNextTab

nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>0 <Plug>AirlineSelectTab0
