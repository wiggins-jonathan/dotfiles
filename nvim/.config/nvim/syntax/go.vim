" Quit if custom syntax already loaded
if exists("b:current_syntax")
  finish
endif

" Define Go's operators (+, =, :=, ||, etc)
syn match goOperator /[-+%<>!&|^*=]=\?/
syn match goOperator /\/\%(=\|\ze[^/*]\)/
syn match goOperator /\%(<<\|>>\|&^\)=\?/
syn match goOperator /:=\|||\|<-\|++\|--/

" Set go keywords for highlighting
hi def link goOperator    Operator
hi def link goType        Identifier
hi def link goSignedInts  Identifier
hi def link goFloats      Identifier
