silent! nunmap R

" nmap R <plug>(SubversiveSubstitute)
" nmap RR <plug>(SubvesiveSubstituteLine)

xmap p <plug>(SubversiveSubstitute)
xmap P <plug>(SubversiveSubstitute)
onoremap ie :exec "normal! ggVG"<cr>
nmap <leader><f2> <plug>(SubversiveSubstituteWordRangeConfirm)ie<CR>
