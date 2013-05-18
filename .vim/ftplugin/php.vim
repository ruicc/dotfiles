set iskeyword+=$

let php_sql_query=0
let php_htmlInStrings=0
"let php_noShortTags=0
let php_folding=0
"au Syntax php set foldmethod=syntax

" :make
set makeprg=php\ -l\ %
set errorformat=%m\ in\ %f\ on\ line\ %l

" smartchr
"inoremap <buffer><expr> $> smartchr#one_of('$this->', '$>')

set expandtab
