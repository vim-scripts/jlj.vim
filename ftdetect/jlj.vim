" Vim filetype detect file
" Language:	jlj Post file
" Maintainer:	Marc Hartstein <marc.hartstein@alum.vassar.edu>
" Last Change:	2007 Dec 22

augroup filetypedetect
    au BufNewFile,BufRead *.jlj/* setf jlj
augroup END
