" Quit if custom syntax already loaded
if exists("b:current_syntax")
  finish
endif

" Define pythons operators
syn keyword pythonOperator  and in is not or
syn match   pythonOperator  '\V=\|-\|+\|*\|@\|/\|%\|&\||\|^\|~\|<\|>\|!=\|:='

" Highlight them
hi def link pythonOperator Operator
