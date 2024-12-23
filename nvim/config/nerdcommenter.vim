let g:NERDCreateDefaultMappings = 0

"nmap <leader>c <plug>NERDCommenterToggle
au VimEnter * nnoremap <leader>c :call NERDComment('n',"toggle")<CR>
au VimEnter * nnoremap <leader>v :call NERDComment('x',"toggle")<CR>
