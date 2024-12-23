local cmd = vim.cmd

cmd('function! SelWithDot()\
        let old_isk = &iskeyword\
        setl iskeyword+=.,:\
        normal viw\
        let &iskeyword = old_isk\
    endfunction')

cmd('function GoFile(file, folder)\
        :silent exec "!mkdir -p " . a:folder\
        :silent exec "!touch " . a:file\
        exec ":e " . a:file\
    endfunction')

cmd('function! NextIndent(exclusive, fwd, lowerlevel, skipblanks)\
    let line = line(".")\
    let column = col(".")\
    let lastline = line("$")\
    let indent = indent(line)\
    let stepvalue = a:fwd ? 1 : -1\
    while (line > 0 && line <= lastline)\
        let line = line + stepvalue\
        if ( ! a:lowerlevel && indent(line) == indent ||\
                \\ a:lowerlevel && indent(line) < indent)\
            if (! a:skipblanks || strlen(getline(line)) > 0)\
                if (a:exclusive)\
                    let line = line - stepvalue\
                    endif\
                    exe line\
                    exe "normal " column . "|"\
                    return\
                endif\
            endif\
        endwhile\
    endfunction')


cmd('function! Preserve(command)\
        let search = @/\
        let cursor_position = getpos(".")\
        normal! H\
        let window_position = getpos(".")\
        call setpos(".", cursor_position)\
        execute a:command\
        let @/ = search\
        call setpos(".", window_position)\
        normal! zt\
        call setpos(".", cursor_position)\
    endfunction')

cmd('function! Save()\
        call Indent()\
        call TrailSpace()\
        write\
    endfunction')

cmd('function! Indent()\
        call Preserve("normal gg=G")\
    endfunction')

cmd('function! TrailSpace()\
        call Preserve("%s/\\s\\+$//e")\
        call Preserve("%s/\\n\\+\\%$//e")\
    endfunction')

cmd('function! VimuxRerun()\
        VimuxInterruptRunner\
        VimuxRunCommand "./make.sh"\
    endfunction')

cmd('augroup VimrcAuGroup\
      autocmd!\
      autocmd FileType vimwiki setlocal foldmethod=expr |\
        setlocal foldenable | set foldexpr=VimwikiFoldLevelCustom(v:lnum)\
    augroup END')

-- cmd('function! RemoveDebugCpp()\
--         call Preserve(":g/\\/\\/debug_$/d")\
--     endfunction')

