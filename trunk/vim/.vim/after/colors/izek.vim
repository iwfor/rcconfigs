" izek.vim
"
" Scheme:       Izek
" Author:       Isaac W. Foraker
" Description:  This color scheme is designed to appease people who look over
"               my shoulder and complain that my color scheme is too hard to
"               read.
" Created:      2007-03-03
" Modified:     2007-03-03
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
let g:colors_name="izek"

" Line Numbering
hi LineNr guifg=yellow

" Cursor color and higlighting
hi CursorLine guibg=#282800
hi CursorColumn guibg=#282800
hi Cursor guibg=red guifg=white

" Search highlighting
hi Search ctermfg=White ctermbg=Blue guifg=black guibg=lightgreen

" Selection highlighting
hi Visual ctermfg=6 ctermbg=7 guibg=blue

" Status lines
hi StatusLine ctermbg=Black ctermfg=Cyan guibg=yellow guifg=darkred
hi StatusLineNC ctermfg=Gray ctermbg=Black guifg=black guibg=white

" Completion Menu
hi Pmenu guifg=black guibg=grey70
hi PmenuSel guifg=white guibg=black

" Syntax colors
hi Normal ctermfg=Gray ctermbg=Black guifg=white guibg=#383810
hi Constant ctermfg=DarkYellow guifg=yellow
hi String ctermfg=Green guifg=lightgreen
hi PreProc ctermfg=Yellow guifg=lightgreen gui=bold
hi Statement cterm=bold ctermfg=yellow gui=bold guifg=yellow
hi Identifier ctermfg=Cyan guifg=green

" Comment colors
hi Comment ctermfg=Magenta guifg=orange gui=none
hi Todo ctermfg=black ctermbg=red guifg=red guibg=black gui=bolditalic
