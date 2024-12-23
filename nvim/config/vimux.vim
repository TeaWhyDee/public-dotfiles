let g:VimuxOrientation = "h"
let g:VimuxHeight = "10"
map <localleader><f5> :VimuxRunLastCommand<CR>
map <localleader>vq :VimuxCloseRunner<CR>
map <localleader>vf :VimuxRunLastCommand<CR>:VimuxInspectRunner<CR>
map <localleader>vi :VimuxInterruptRunner<CR>
" autocmd BufEnter *.cpp map <localleader>vr :call VimuxRunCommand("g++ " . expand("%:p:h") . "/main.cpp &&" . "./a.out")<CR>
autocmd BufEnter *.cpp map <silent> <localleader>vr :call SaveAdnRunCode("g++ -std=c++17 " . expand("%:p:h") . "/main.cpp && ./a.out")<CR>
autocmd BufEnter *.cpp map <localleader>vc :call SaveAdnRunCode("g++ -std=c++17 " . expand("%:p") . " && ./a.out")<CR>

autocmd BufEnter *.py map <silent> <localleader>vr :call SaveAdnRunCode("python " . expand("%:p"))<CR>
autocmd BufEnter *.py map <silent> <localleader>vc :call SaveAdnRunCode("python " . expand("%:p"))<CR>

autocmd BufEnter *.java map <silent> <localleader>vr :call SaveAdnRunCode("javacc.sh " . expand("%:p"))<CR>
autocmd BufEnter *.java map <silent> <localleader>vc :call SaveAdnRunCode("javacc.sh " . expand("%:p"))<CR>

autocmd BufEnter *.rs map <silent> <localleader>vr :call SaveAdnRunCode("cargo run")<CR>
autocmd BufEnter *.rs map <silent> <localleader>vc :call SaveAdnRunCode("cargo run")<CR>

autocmd BufEnter *.sh map <silent> <localleader>vr :call SaveAdnRunCode("bash " . expand("%:p"))<CR>
autocmd BufEnter *.sh map <silent> <localleader>vc :call SaveAdnRunCode("bash " . expand("%:p"))<CR>
" autocmd BufEnter *.cpp map <Leader>vc :call SaveAdnRunCode("g++ -std=c++17 " . expand("%:p") . " && ./a.out")<CR>

function! SaveAdnRunCode(command)
    :w
    :call VimuxRunCommand(a:command)
endfunction

function! GetRange()
    let @" = substitute(@", '\n', '\\n', 'g')
endfunction

au VimResized * call UpdateVimux()
au VimEnter * call UpdateVimux()

function! UpdateVimux()
    if winwidth(0) > 110
        let g:VimuxOrientation = "h"
        echom "Vimux now vertical"
    else
        let g:VimuxOrientation = "v"
        echom "Vimux now horizontal"
    endif
endfunction

" C
autocmd BufEnter *.c map <silent> <Leader>vr :call SaveAdnRunCode("gcc " . expand("%:p:h") . "/main.c && ./a.out")<CR>
autocmd BufEnter *.c map <Leader>vc :call SaveAdnRunCode("gcc " . expand("%:p") . " && ./a.out")<CR>
