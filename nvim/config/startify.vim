let g:startify_session_sort = 0
let g:startify_custom_header = 'startify#pad(startify#fortune#cowsay())'

let g:startify_lists = [
            \ { 'type': 'files',     'header': ['   💦 Last files 💦']            },
            \ { 'type': 'dir',       'header': ['   PWD: '. getcwd()] },
            \ { 'type': 'sessions',  'header': ['   💅 Sessions 💅']       },
            \ { 'type': 'bookmarks', 'header': ['   💀 Bookmarks 💀']      },
            \ { 'type': 'commands',  'header': ['   Commands']       },
            \ ]

let g:startify_bookmarks = [
            \ { 'c': '~/.config/nvim/' },
            \ { 'B': '~/.bashrc' },
            \ { 'w': '~/vimwiki/index.wiki' },
            \ { 'W': '~/vimwiki2/index.wiki' },
            \ { 'g': '~/luft_game_doc/index.md' },
            \ ]

let g:ascii = [
            \ '💲 ▓█████▄  ██▀███   ██▓ ██▓███      ██▒   █▓ ██▓ ███▄ ▄███▓ 💲',
            \ '💲 ▒██▀ ██▌▓██ ▒ ██▒▓██▒▓██░  ██▒   ▓██░   █▒▓██▒▓██▒▀█▀ ██▒ 💲',
            \ '💲 ░██   █▌▓██ ░▄█ ▒▒██▒▓██░ ██▓▒    ▓██  █▒░▒██▒▓██    ▓██░ 💲',
            \ '💲 ░▓█▄   ▌▒██▀▀█▄  ░██░▒██▄█▓▒ ▒     ▒██ █░░░██░▒██    ▒██  💲',
            \ '💲 ░▒████▓ ░██▓ ▒██▒░██░▒██▒ ░  ░      ▒▀█░  ░██░▒██▒   ░██▒ 💲',
            \ '💲  ▒▒▓  ▒ ░ ▒▓ ░▒▓░░▓  ▒▓▒░ ░  ░      ░ ▐░  ░▓  ░ ▒░   ░  ░ 💲',
            \ '💲  ░ ▒  ▒   ░▒ ░ ▒░ ▒ ░░▒ ░           ░ ░░   ▒ ░░  ░      ░ 💲',
            \ '💲  ░ ░  ░   ░░   ░  ▒ ░░░               ░░   ▒ ░░      ░    💲',
            \ '💲    ░       ░      ░                      ░   ░         ░  💲  ',
            \ '💲  ░                                              ░         💲  '
            \ ]

let g:empty = ['']

" let g:startify_custom_header =
" \ startify#pad( g:ascii )

let g:startify_custom_header =
            \ startify#pad( g:empty )



"let g:startify_custom_footer =
            "\ ['', "   🔥 🔥 🔥 🔥 🔥 🔥 🔥 🔥 🔥 🔥 🔥 D R I P 🔥 🔥 🔥 🔥 🔥 🔥 🔥 🔥 🔥 🔥 🔥 🔥", '']
