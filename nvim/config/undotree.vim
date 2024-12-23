nmap <Leader>ru :UndotreeToggle<CR>

let g:undotree_WindowLayout = 4
let g:undotree_ShortIndicators = 1

let g:undotree_SplitWidth = 23
let g:undotree_DiffpanelHeight = 10
let g:undotree_DiffAutoOpen = 1

" if set, let undotree window get focus after being opened, otherwise
" focus will stay in current window.
let g:undotree_SetFocusWhenToggle = 1

" au VimResized * call UpdateUndoTree()

" function! UpdateUndoTree()
"     echomsg "asd"
"     if winwidth(0) > 120
"         let g:VimuxOrientation = "h"
"     else
"         let g:VimuxOrientation = "v"
"         echom "Vimux now horizontal"
"     endif
" endfunction
