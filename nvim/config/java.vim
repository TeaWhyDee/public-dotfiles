call  plug#begin('~/.config/nvim/bundle')
	" JAVA
 	Plug 'rustushki/JavaImp.vim'
	let g:JavaImpPaths = 
		\ $HOME . "/Documents/GitHub/Innopolis/PSS/Week7/ex1,"
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	let g:deoplete#enable_smart_case = 1
	let g:deoplete#sources = {}
	let g:deoplete#sources.java = ['jc', 'javacomplete2', 'file', 'buffer', 'ultisnips']
	inoremap <silent><expr> <TAB>
	    \ pumvisible() ?  "\<C-n>" :
	    \ <SID>check_back_space() ? "\<TAB>" :
	    \ deoplete#mappings#manual_complete()
	function! s:check_back_space() abort "" {{{
	    let col = col('.') - 1
	    return !col || getline('.')[col - 1]  =~ '\s'
endfunction "" }}}

call plug#end()
