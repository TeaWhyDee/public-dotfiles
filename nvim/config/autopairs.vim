" g:AutoPairsMultilineClose = 0
" g:AutoPairs={'(':')', '[':']', '{':'}',"'":"'",'"':'"', "`":"`", '```':'```', '"""':'"""', "'''":"'''"}
autocmd BufNewFile,BufRead *tex let b:AutoPairs={'(':')', '[':']', '{':'}',"'":"'",'"':'"', "`":"`", '```':'```', '"""':'"""', "'''":"'''", "$":"$"}
autocmd BufNewFile,BufRead *md let b:AutoPairs={'(':')', '[':']', '{':'}',"'":"'",'"':'"', "`":"`", '```':'```', '"""':'"""', "'''":"'''", "**":"**", "$$":"$$"}
let g:AutoPairsMultilineClose = 0
" au FileType html let b:AutoPairs = AutoPairsDefine({'<!--' : '-->'}, ['{'])
