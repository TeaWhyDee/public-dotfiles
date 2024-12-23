let g:tagbar_type_vimwiki = {
          \   'ctagstype':'all'
          \ , 'kinds':['h:header']
          \ , 'sro':'&&&'
          \ , 'kind2scope':{'h':'header'}
          \ , 'sort':0
          \ , 'ctagsbin':'~/.local/bin/vwtags.py'
          \ , 'ctagsargs': 'default'
          \ }

nmap <F11> :TagbarToggle<CR>
