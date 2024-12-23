" Shorten error/warning flags
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_open_list = 0

let g:ale_linters = {
            \  'cs':['syntax', 'semantic', 'issues'],
            \  'python': ['pylint'],
            \  'java': ['javac']
            \ }

