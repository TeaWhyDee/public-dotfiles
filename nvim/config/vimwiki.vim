let g:vimwiki_conceallevel=1

let g:vimwiki_list = [
            \ {'path': '~/vimwiki/',  'syntax': 'markdown', 'ext': '.md'},
            \ {'path': '~/vimwiki2/', 'syntax': 'markdown', 'ext': '.md'},
            \ {'path': '~/encrypted/encrypted/vimwiki/'},
            \ {'path': '~/Documents/Godot/LUFT/doc/', 'syntax': 'markdown', 'ext': '.md'}]


let g:vimwiki_key_mappings = { 
            \ 'table_mappings': 0, 
            \ 'links': 0,
            \ }


:hi VimwikiHeader1 guifg=#f56b3e
:hi VimwikiHeader1 gui=bold
:hi VimwikiHeader2 guifg=#f5a14c
:hi VimwikiHeader2 gui=bold
:hi VimwikiHeader3 guifg=#EFE070
:hi VimwikiHeader3 gui=bold
:hi VimwikiHeader4 guifg=#aade62
:hi VimwikiHeader4 gui=bold
:hi VimwikiHeader5 guifg=#62de62
:hi VimwikiHeader5 gui=bold
:hi VimwikiHeader6 guifg=#62dea0
:hi VimwikiHeader6 gui=bold

" unmap <Leader>wt
nmap <Leader>wt <Plug>VimwikiMakeDiaryNote
nmap <Leader>wp <Plug>VimwikiDiaryPrevDay
nmap <Leader>wn <Plug>VimwikiDiaryNextDay
nmap <Leader>wy <Plug>VimwikiMakeYesterdayDiaryNote
nmap <Leader>wT <Plug>VimwikiMakeTomorrowDiaryNote
nmap <Leader>wi <Plug>VimwikiDiaryIndex <Plug>VimwikiDiaryGenerateLinks
nmap <Leader>wu <Plug>VimwikiDiaryGenerateLinks
nmap <Leader>> <Plug>VimwikiIncreaseLvlSingleItem
nmap <Leader>< <Plug>VimwikiDecreaseLvlSingleItem
nmap ` <Plug>VimwikiToggleListItem
nmap <A-`> <Plug>VimwikiIncrementListItem
nmap <CR> <Plug>VimwikiFollowLink

nmap <Leader><CR> <Plug>VimwikiVSplitLink

let g:vimwiki_folding="expr"
let g:taskwiki_dont_preserve_folds="yes"
let g:taskwiki_dont_fold="yes"

let g:taskwiki_sort_orders={"D": "due+"}

let g:tagbar_type_vimwiki = {
          \   'ctagstype':'vimwiki'
          \ , 'kinds':['h:header']
          \ , 'sro':'&&&'
          \ , 'kind2scope':{'h':'header'}
          \ , 'sort':0
          \ , 'ctagsbin':'/home/tea/h.config/nvim_custom/bundle/utils/vwtags.py'
          \ , 'ctagsargs': 'default'
          \ }

function CreateVimwikiHeader()
    let s:arr = split(g:vimwiki#base#current_subdir(), "/")
    let s:string = "[[/index.md|index]]"
    let s:subdir = ""
    for s:i in range(len(s:arr))
        let s:string = s:string."> [["
        let s:subdir = s:arr[s:i]
        for s:j in range(s:i+1)
            let s:string = s:string."/".s:arr[s:j]
        endfor
        let s:string = s:string."/index.md|".s:subdir."]]"
    endfor
    let s:string = s:string."> [[/".g:vimwiki#base#current_subdir().expand("%:t")."|".expand("%:t")."]]"
    call append(0, s:string)
endfunction

augroup myvimwiki
    autocmd!
    au BufNewFile *.md call CreateVimwikiHeader()
    " au BufEnter *.wiki set textwidth=60
    " au BufNewFile,BufEnter **/diary/*.wiki call CreateVimwikiDiaryHeader()
augroup END

  
function! VimwikiFoldLevelCustom(lnum)
  let pounds = strlen(matchstr(getline(a:lnum), '^#\+'))
  if (pounds)
    return '>' . pounds  " start a fold level
  endif
  if getline(a:lnum) =~? '\v^\s*$'
    if (strlen(matchstr(getline(a:lnum + 1), '^#\+')))
      return '-1' " don't fold last blank line before header
    endif
  endif
  return '=' " return previous fold level
endfunction



