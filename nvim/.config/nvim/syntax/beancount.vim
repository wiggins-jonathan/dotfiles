if exists("b:current_syntax")
  finish
endif

" Basics.
syn match   beanMarker "\v(\{\{\{|\}\}\})\d?" contained
syn region  beanComment start="\s*;" end="$" keepend contains=beanMarker
syn region beanString start='"' skip='\\"' end='"' contained
syn match beanAmount "\v[-+]?[[:digit:].,]+" nextgroup=beanCurrency contained
            \ skipwhite
syn match beanCurrency "\v\w+" contained
" Account name: alphanumeric with at least one colon.
syn match beanAccount "\v[[:alnum:]]+:[-[:alnum:]:]+" contained
syn match beanTag "\v#[-[:alnum:]]+" contained
syn match beanLink "\v\^\S+" contained
" We must require a space after the flag because you can have flags per
" transaction leg, and the letter-based flags might get confused with the
" start of an account name.
syn match beanFlag "\v[*!&#?%PSTCURM]\s\@=" contained

" Most directives start with a date.
syn match beanDate "^\v\d{4}[-/]\d{2}[-/]\d{2}" skipwhite
            \ nextgroup=beanOpen,beanTxn,beanClose,beanNote,beanBalance,beanEvent,beanPad,beanPrice
" Options and events have two string arguments. The first, we are matching as
" beanOptionTitle and the second as a regular string.
syn region beanOption matchgroup=beanKeyword start="^option" end="$"
            \ keepend contains=beanOptionTitle,beanComment
syn region beanOption matchgroup=beanKeyword start="^plugin" end="$"
            \ keepend contains=beanString,beanComment
syn region beanInclude matchgroup=beanKeyword start="^include" end="$"
            \ keepend contains=beanString,beanComment
syn region beanEvent matchgroup=beanKeyword start="event" end="$" contained
            \ keepend contains=beanOptionTitle,beanComment
syn region beanOptionTitle start='"' skip='\\"' end='"' contained
            \ nextgroup=beanString skipwhite
syn region beanOpen matchgroup=beanKeyword start="open" end="$" keepend
            \ contained contains=beanAccount,beanCurrency,beanComment
syn region beanClose matchgroup=beanKeyword start="close" end="$" keepend
            \ contained contains=beanAccount,beanComment
syn region beanNote matchgroup=beanKeyword start="\vnote|document" end="$"
            \ keepend contains=beanAccount,beanString,beanComment contained
syn region beanBalance matchgroup=beanKeyword start="balance" end="$" contained
            \ keepend contains=beanAccount,beanAmount,beanComment
syn region beanPrice matchgroup=beanKeyword start="price" end="$" contained
            \ keepend contains=beanCurrency,beanAmount
syn region beanPushTag matchgroup=beanKeyword start="\v^(push|pop)tag" end="$"
            \ keepend contains=beanTag
syn region beanPad matchgroup=beanKeyword start="pad" end="$" contained
            \ keepend contains=beanAccount,beanComment

syn region beanTxn matchgroup=beanKeyword start="\v\s+(txn|[*!&#?%PSTCURM])" skip="^\s"
            \ end="^" keepend contained fold
            \ contains=beanString,beanPost,beanComment,beanTag,beanLink,beanMeta
syn region beanPost start="^\v\C\s+(([*!&#?%PSTCURM]\s+)?[A-Z])@=" end="$"
            \ contains=beanFlag,beanAccount,beanAmount,beanComment,beanCost,beanPrice
syn region beanMeta matchgroup=beanTag start="^\v\C\s+[a-z][-_a-zA-Z0-9]*:(\s|$)@=" end="$"

syn region beanCost start="{" end="}" contains=beanAmount contained
syn match beanPrice "\V@@\?" nextgroup=beanAmount contained

syn region beanHashHeaderFold
    \ start="^\z(#\+\)"
    \ skip="^\s*\z1#\+"
    \ end="^\(#\)\@="
    \ fold contains=TOP

syn region beanStarHeaderFold
    \ start="^\z(\*\+\)"
    \ skip="^\s*\z1\*\+"
    \ end="^\(\*\)\@="
    \ fold contains=TOP

hi def link beanKeyword     Keyword
hi def link beanOptionTitle Keyword
hi def link beanDate        Keyword
hi def link beanString      String
hi def link beanComment     Comment
hi def link beanAccount     Identifier
hi def link beanAmount      Number
hi def link beanCurrency    Number
hi def link beanCost        Number
hi def link beanPrice       Number
hi def link beanTag         Comment
hi def link beanLink        Comment
hi def link beanMeta        Comment
hi def link beanFlag        Keyword
