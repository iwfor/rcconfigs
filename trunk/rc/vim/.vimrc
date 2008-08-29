"set mouse=a
set mousemodel=popup_setpos
set novb
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab
set diffopt=iwhite,filler
"Turn tabs into spaces
set autoindent
"set smartindent
"set nowrap

" Allow Vim to open a LOT of tabs at one time
set tabpagemax=100

" Use smart case checking in searches.  Requires both ignorecase and smartcase.
set ignorecase
set smartcase

" Enable highlighting of the curor position
"if exists('+cursorcolumn')
"    set cursorcolumn
"endif
if exists('+cursorline')
    set cursorline
endif

" Turn on linebreak to wrap long lines properly
set linebreak

set showmode
set showcmd
"# showmatch: highlight matching parenthesis
set showmatch
"# matchtime: tenths of second to show paren match when showmatch is set
set matchtime=10
set backspace=start,indent,eol
set viminfo='20,\"50    " read/write a .viminfo file, don't store more than 50 lines of registers
set history=50
set number
set laststatus=2
set statusline=%-f\ %-n%=[%Y%R%M][0x%B/L%l/C%c/B%o/%p%%]
set makeprg=make
"# virtualedit: allow cursor positioning where no character in certain modes
set virtualedit=block
filetype indent on
let Tlist_Ctags_Cmd = 'ctags'

"#################################################################### 
"# Configure folding
"#
"# Cheat Sheet
"#  zo, zO - open folds
"#  zc, zC - close folds
"#  zm, zM - close all folds
"#  zr, zR - open all folds
"#  zj     - jump to next fold
"#  zk     - jump up to previous fold
"#  [z, ]z - jump to top/bottom of fold
set foldcolumn=1
set foldmethod=indent
set foldlevel=1
set nofoldenable

"#################################################################### 
"# 
"# Mappings and Commands 
"# 
"####################################################################

"# Cheat Sheet
"#
"#  F1 - Toggle search highlighting
"#  F2 - Toggle line numbers
nmap <F1> :nohls<cr>
nmap <F2> :set nu!<cr>


"# Some common emacs mappings: ^N, ^A, ^E
nmap <c-n> :n<cr>
imap <c-a> <c-o>^
imap <c-e> <c-o>$


" Integrate aspell with vim
set autowrite
map <Leader>s <Esc>:!aspell -c --dont-backup "%"<CR>:e! "%"<CR><CR>

" Integrate dictionary and thesaurus lookups
map <Leader>d <Esc>:silent !firefox "http://www.m-w.com/cgi-bin/Thesaurus?book=Thesaurus&va=<cword>"<CR>

" Make up and down arrows always traverse visual lines
map <UP> g<UP>
imap <UP> <C-O>g<UP>
map <DOWN> g<DOWN>
imap <DOWN> <C-O>g<DOWN>

" open the current directory in a new tab
nmap \. :tabnew .<CR>

" open the most recent buffer in a new tab
nmap \# :tabnew #<CR>

"####################################################################
"#
"# Abbreviations
"#
"####################################################################
abbreviate ctor constructor
abbreviate Ctor Constructor
abbreviate dtor destructor
abbreviate Dtor Destructor
abbreviate #i #include
abbreviate #d #define

" Fix common spelling mistakes
abbr teh the
abbr Teh The
abbr accross across
abbr Accross Across

nnoremap <silent> <F7> :Tlist<CR>
command Q :q
command Wq :wq
command WQ :wq
command Tabn :tabn
command Tabp :tabp
command Tabnew :tabnew

command ReloadDocs :helptags ~/.vim/doc

if has("gui_macvim")
  let macvim_hig_shift_movement = 1
endif

autocmd FileType sh,vim,tcl,java,html,css,jam,xml,xsl,zsh,tcsh,sh,bash,nsis     call ProgrammingSettings()
autocmd FileType c,cpp                                                          call CxxSettings()
autocmd FileType perl                                                           call TwoSpaceSettings() 
autocmd FileType python,yaml                                                    call TwoSpaceSettings()
autocmd FileType ruby,eruby                                                     call RubySettings()
autocmd FileType mail,text                                                      call PlainTextSettings()
autocmd FileType make                                                           call MakefileSettings()

" Fix the backspace
"set t_kb=
"set t_kD=

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
    set incsearch

    " Load my colorscheme
    colorscheme izek

endif

augroup cprog
    " Remove all cprog autocommands
    au!

    " When starting to edit a file:
    "   For C and C++ files set formatting of comments and set C-indenting on.
    "   For other files switch it off.
    "   Don't change the order, it's important that the line with * comes first.
    autocmd FileType *      set formatoptions=tcql nocindent comments&
    autocmd FileType c,cpp  set formatoptions=croql cindent comments=sr:/*,mb:*,el:*/,://
augroup END

augroup gzip
    " Remove all gzip autocommands
    au!

    " Enable editing of gzipped files
    " set binary mode before reading the file
    autocmd BufReadPre,FileReadPre      *.gz,*.bz2 set bin
    autocmd BufReadPost,FileReadPost    *.gz call GZIP_read("gunzip")
    autocmd BufReadPost,FileReadPost    *.bz2 call GZIP_read("bunzip2")
    autocmd BufWritePost,FileWritePost  *.gz call GZIP_write("gzip")
    autocmd BufWritePost,FileWritePost  *.bz2 call GZIP_write("bzip2")
    autocmd FileAppendPre                       *.gz call GZIP_appre("gunzip")
    autocmd FileAppendPre                       *.bz2 call GZIP_appre("bunzip2")
    autocmd FileAppendPost              *.gz call GZIP_write("gzip")
    autocmd FileAppendPost              *.bz2 call GZIP_write("bzip2")

    " After reading compressed file: Uncompress text in buffer with "cmd"
    fun! GZIP_read(cmd)
    " set 'cmdheight' to two, to avoid the hit-return prompt
    let ch_save = &ch
    set ch=3
    " when filtering the whole buffer, it will become empty
    let empty = line("'[") == 1 && line("']") == line("$")
    let tmp = tempname()
    let tmpe = tmp . "." . expand("<afile>:e")
    " write the just read lines to a temp file "'[,']w tmp.gz"
    execute "'[,']w " . tmpe
    " uncompress the temp file "!gunzip tmp.gz"
    execute "!" . a:cmd . " " . tmpe
    " delete the compressed lines
    '[,']d
    " read in the uncompressed lines "'[-1r tmp"
    set nobin
    execute "'[-1r " . tmp
    " if buffer became empty, delete trailing blank line
    if empty
      normal Gdd''
    endif
    " delete the temp file
    call delete(tmp)
    let &ch = ch_save
    " When uncompressed the whole buffer, do autocommands
    if empty
      execute ":doautocmd BufReadPost " . expand("%:r")
    endif
    endfun

    " After writing compressed file: Compress written file with "cmd"
    fun! GZIP_write(cmd)
    if rename(expand("<afile>"), expand("<afile>:r")) == 0
      execute "!" . a:cmd . " <afile>:r"
    endif
    endfun

    " Before appending to compressed file: Uncompress file with "cmd"
    fun! GZIP_appre(cmd)
        execute "!" . a:cmd . " <afile>"
        call rename(expand("<afile>:r"), expand("<afile>"))
    endfun

augroup END

" now map some keys
" goto next file
map  :n
" format from last mark
map f :'a,.!fmt
" format C/C++ comments
map F :'a,.!comfmt

function PlainTextSettings ()
    setlocal shiftwidth=4
    setlocal tabstop=4
    setlocal noexpandtab
    setlocal wrap
    setlocal spell
    setlocal nonumber
endfunction

function ProgrammingSettings ()
    setlocal tabstop=4
    setlocal softtabstop=4
    setlocal shiftwidth=4
    setlocal expandtab
endfunction

function CxxSettings()
    call ProgrammingSettings()
    set dictionary+=~/.vim/dictionary/cxx_keywords.txt
    set dictionary+=~/.vim/dictionary/cxx_stdlib.txt

    imap <buffer> <CR> <C-R>=CxxEndToken()<CR>
endfunction

function TwoSpaceSettings()
    setlocal tabstop=8
    setlocal softtabstop=2
    setlocal shiftwidth=2
    setlocal expandtab
endfunction

function MakefileSettings()
    setlocal tabstop=4
    setlocal softtabstop=4
    setlocal shiftwidth=4
    setlocal noexpandtab
    set dictionary+=~/.vim/dictionary/make.txt
    " Put in a couple of common completions
"    imap <buffer> ( ()<C-O>i
"    imap <buffer> { {}<C-O>i
endfunction

function RubySettings ()
    call TwoSpaceSettings()
    set dictionary+=~/.vim/dictionary/ruby.txt

    imap <buffer> <CR> <C-R>=RubyEndToken()<CR>
endfunction

"
" Automagically add end or close brace in Ruby code. (pjones)
" Updated to match on lines ending in comments too. (IF)
"
function RubyEndToken ()
    let current_line = getline( '.' )
    if len(current_line) == 0
        return "\<CR>"
    endif
    let braces_at_end = '{\s*\(|\(,\|\s\|\w\)*|\s*\)\?\(\s*#.*\)\?$'
    let stuff_without_do = '^\s*\(class\|if\|unless\|begin\|case\|for\|module\|while\|until\|def\)'
    let with_do = 'do\s*\(|\(,\|\s\|\w\)*|\s*\)\?\(\s*#.*\)\?$'

    if AtEndOfLine() == 0
        return "\<CR>"
    endif
    if match(current_line, braces_at_end) >= 0
        return "\<CR>}\<C-O>O"
    elseif match(current_line, stuff_without_do) >= 0
        return "\<CR>end\<C-O>O"
    elseif match(current_line, with_do) >= 0
        return "\<CR>end\<C-O>O"
    else
        return "\<CR>"
    endif
endfunction

"
" Automagically add closing brace
"
function CxxEndToken ()
    let current_line = getline( '.' )
    if len(current_line) == 0
        return "\<CR>"
    endif
    let brace_and_semicolon_at_end = '\(class\|struct\|=\)\s*{\s*\(//.*\)\?\(/\*.*\*/\)\?$'
    let brace_at_end = '{\s*\(//.*\)\?\(/\*.*\*/\)\?$'
    let do_while = 'do\s*{\s*\(//.*\)\?\(/\*.*\*/\)\?$'
    let preproc_if = '^#\(\s*\)if'

    " Only process end token if the cursor is at the end of the line
    if AtEndOfLine() == 0
        return "\<CR>"
    endif
    if match(current_line, brace_and_semicolon_at_end) >= 0
        " Add a closing brace and a semicolon
        return "\<C-O>o};\<C-O>O"
    elseif match(current_line, do_while) >= 0
        " Fill in the closing brace and while of a do/while
        return "\<C-O>o} while();\<C-O>O"
    elseif match(current_line, brace_at_end) >= 0
        " Add a plain closing brace
        return "\<C-O>o}\<C-O>O"
    endif

    let preproc_if_match = matchlist(current_line, preproc_if)
    if preproc_if_match != []
        " Add a closing #endif, preserving preprocessor indentation
        return "\<C-O>o#" . preproc_if_match[1] . "endif\<C-O>O"
    end
    " Nothing matched, so just pass thru a CR
    return "\<CR>"
endfunction

"
" Determine if the cursor is at the end of the current line
"
function AtEndOfLine ()
    let pos = getpos('.')
    let length = len(getline('.'))
    if pos[2] >= length
        return 1
    else
        return 0
    endif
endfunction

"
" Try to do some magic with the HOME key, toggling between col 1 and first
" character on line.
"
"imap <HOME> <C-R>=ISpecialHomeKey()<CR>
"function ISpecialHomeKey()
"    if col('.') == 1
"        return "\<c-o>^"
"    else
"        return "\<c-o>0"
"    endif
"endfunction

" Automagically change directories to the currently selected buffer.
if exists('+autochdir')
    " Great!  It's supported!
    set autochdir
else
    " If autochdir is not supported, try this shameless hack.
    autocmd BufEnter * sil! lcd %:p:h:gs/ /\\ /g
endif
