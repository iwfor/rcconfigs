" iwf.vim
"
" Scheme:   IWF
" Author:   Isaac W. Foraker
" Created:  2007-03-03
" Modified: 2007-03-03
"

set background=dark
if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif
let g:colors_name="iwf"

" Editor colors
hi LineNr guifg=yellow
hi CursorLine guibg=#282808
hi CursorColumn guibg=#282808
hi Cursor guibg=red guifg=white
hi StatusLine ctermbg=Black ctermfg=Cyan guibg=white guifg=brown
hi StatusLineNC ctermfg=Gray ctermbg=Black guifg=black guibg=white
hi Search ctermfg=White ctermbg=Blue guifg=black guibg=lightgreen
hi Visual ctermfg=6 ctermbg=7 guifg=White guibg=Purple

" Syntax colors
hi Normal ctermfg=Gray ctermbg=Black guifg=white guibg=#444411
hi Constant ctermfg=DarkYellow guifg=yellow
hi String ctermfg=Green guifg=lightgreen
hi PreProc ctermfg=Yellow guifg=lightgreen gui=bold
hi Statement cterm=bold ctermfg=yellow gui=bold guifg=yellow
hi Identifier ctermfg=Cyan guifg=green

" Comment colors
hi Comment ctermfg=Magenta guifg=orange gui=bold
hi Todo ctermfg=black ctermbg=red guifg=red guibg=black gui=bolditalic
