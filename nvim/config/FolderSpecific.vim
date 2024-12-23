autocmd BufNewFile,BufRead /home/tea/Documents/GitHub/sxiv* set tabstop=2 shiftwidth=2 noexpandtab
autocmd BufNewFile,BufRead /home/tea/Documents/GitHub/TWD-Website-src/* nmap <silent> <Leader>rg :!bash -c "python3 ~/Documents/GitHub/TWD-Website-src/generate.py"<CR>
