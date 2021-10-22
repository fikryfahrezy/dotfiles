let s:coc_extensions = [
	\ 'coc-html',
    \ 'coc-css',
	\]

for extension in s:coc_extensions
	call coc#add_extension(extension)
endfor
