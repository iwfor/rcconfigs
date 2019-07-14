set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
try
  call vundle#begin()
  " alternatively, pass a path where Vundle should install plugins
  "call vundle#begin('~/some/path/here')

  " let Vundle manage Vundle, required
  Plugin 'gmarik/Vundle.vim'
  Plugin 'beloglazov/vim-online-thesaurus'
  "Plugin 'reedes/vim-wordy'
  Plugin 'reedes/vim-textobj-quote'
  Plugin 'tpope/vim-commentary'
  Plugin 'bling/vim-airline'
  Plugin 'majutsushi/tagbar'
  Plugin 'tpope/vim-fugitive'
  Plugin 'airblade/vim-gitgutter'
  Plugin 'tpope/vim-surround'
  Plugin 'ecomba/vim-ruby-refactoring'
  Plugin 'rust-lang/rust.vim'
  Plugin 'scrooloose/syntastic'
  Plugin 'udalov/kotlin-vim'

  " The following are examples of different formats supported.
  " Keep Plugin commands between vundle#begin/end.
  " plugin on GitHub repo
  "Plugin 'tpope/vim-fugitive'
  " plugin from http://vim-scripts.org/vim/scripts.html
  "Plugin 'L9'
  " Git plugin not hosted on GitHub
  "Plugin 'git://git.wincent.com/command-t.git'
  " git repos on your local machine (i.e. when working on your own plugin)
  "Plugin 'file:///home/gmarik/path/to/plugin'
  " The sparkup vim script is in a subdirectory of this repo called vim.
  " Pass the path to set the runtimepath properly.
  "Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
  " Avoid a name conflict with L9
  "Plugin 'user/L9', {'name': 'newL9'}

  " All of your Plugins must be added before the following line
  call vundle#end()            " required
catch
  " Weeping
endtry

filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"set mouse=a
set mousemodel=popup_setpos
set novb
set tabstop=4
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

let g:rsenseHome="/opt/rsense-0.2"

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Here begins my automated wordcount addition.
" This combines several ideas from:
" http://stackoverflow.com/questions/114431/fast-word-count-function-in-vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:word_count="<unknown>"
function WordCount()
  return g:word_count
endfunction
function UpdateWordCount()
  let lnum = 1
  let n = 0
  while lnum <= line('$')
    let n = n + len(split(getline(lnum)))
    let lnum = lnum + 1
  endwhile
  let g:word_count = n
endfunction
" Update the count when cursor is idle in command or insert mode.
" Update when idle for 1000 msec (default is 4000 msec).
set updatetime=1000
augroup WordCounter
  au! CursorHold,CursorHoldI * call UpdateWordCount()
augroup END
" Set statusline, shown here a piece at a time
highlight User1 ctermbg=green guibg=green ctermfg=black guifg=black
" Old Status Line
"set statusline=%-f\ %-n%=[%Y%R%M][0x%B/L%l/C%c/B%o/%p%%]
" Status Line with word count
set statusline+=%<%F          " file name, cut if needed at start
set statusline+=\ %-n
set statusline+=%=            " separator from left to right justified
set statusline+=[%Y%R%M]      " File Type, R/O Flag, Modified Flag
set statusline+=[%{WordCount()}W]
set statusline+=[0x%B/L%l/C%c/B%o/%p%%]

" Airline status line configuration
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'

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
nmap <F8> :TagbarToggle<cr>


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

" Set a preferred font
if has("gui_running")
  set guifont=Hack\ 14,DejaVu\ Sans\ Mono\ 14,Courier\ 14
endif

fun! SetMyTheme()
  " &t_Co is number of supported colors
  if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
    set incsearch
    try
      " Set my theme if it's installed.
      colorscheme izek
    catch /^Vim/
      colorscheme industry
    endtry
  endif
endfun

fun! SetWritingTheme()
  " &t_Co is number of supported colors
  if &t_Co > 2 || has("gui_running")
    syntax off
    set hlsearch
    set incsearch
    colorscheme morning
  endif
endfun

call SetMyTheme()

" These are the other Ruby file types
autocmd BufRead,BufNewFile Rakefile set filetype=ruby
autocmd BufRead,BufNewFile rakefile set filetype=ruby
autocmd BufRead,BufNewFile *.rake   set filetype=ruby
autocmd BufRead,BufNewFile .irbrc   set filetype=ruby
autocmd BufRead,BufNewFile *.rjs    set filetype=ruby

" Force other file types
autocmd BufRead,BufNewFile *.md     set filetype=markdown

autocmd FileType sh,tcl,java,jam,zsh,tcsh,sh,bash,nsis  call ProgrammingSettings()
autocmd FileType fsx                                    call ProgrammingSettings()
autocmd FileType c,cpp                                  call CxxSettings()
autocmd FileType perl                                   call TwoSpaceSettings() 
autocmd FileType python,yaml                            call TwoSpaceSettings()
autocmd FileType html,xhtml,css,xml,xsl,vim             call TwoSpaceSettings()
autocmd FileType ruby,eruby,js                          call RubySettings()
autocmd FileType mail,text                              call PlainTextSettings()
autocmd FileType make                                   call MakefileSettings()
autocmd FileType markdown                               call MarkdownSettings()

" Fix the backspace (This can vary from platform to platform depending on terminal)
"set t_kb=
"set t_kD=

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
    autocmd BufReadPre,FileReadPre      *.gz,*.bz2,*.xz set bin
    autocmd BufReadPost,FileReadPost    *.gz  call GZIP_read("gunzip")
    autocmd BufReadPost,FileReadPost    *.bz2 call GZIP_read("bunzip2")
    autocmd BufReadPost,FileReadPost    *.xz  call GZIP_read("unxz")
    autocmd BufWritePost,FileWritePost  *.gz  call GZIP_write("gzip")
    autocmd BufWritePost,FileWritePost  *.bz2 call GZIP_write("bzip2")
    autocmd BufWritePost,FileWritePost  *.xz  call GZIP_write("xz")
    autocmd FileAppendPre               *.gz  call GZIP_appre("gunzip")
    autocmd FileAppendPre               *.bz2 call GZIP_appre("bunzip2")
    autocmd FileAppendPre               *.xz  call GZIP_appre("unxz")
    autocmd FileAppendPost              *.gz  call GZIP_write("gzip")
    autocmd FileAppendPost              *.bz2 call GZIP_write("bzip2")
    autocmd FileAppendPost              *.xz  call GZIP_write("xz")

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
    setlocal spell spelllang=en_us
    setlocal nonumber
endfunction

function ProgrammingSettings ()
    call SetMyTheme()
    setlocal tabstop=4
    setlocal softtabstop=4
    setlocal shiftwidth=4
    setlocal expandtab
    call MapCommentatorQuickKey()
endfunction

function MapCommentatorQuickKey ()
    " Map commentator to ^C
    imap <c-c> <c-o>gcc
    nmap <c-c> gcc
    vmap <c-c> gc
endfunction

function CxxSettings()
    call ProgrammingSettings()
    set dictionary+=~/.vim/dictionary/cxx_keywords.txt
    set dictionary+=~/.vim/dictionary/cxx_stdlib.txt

    imap <buffer> <CR> <C-R>=CxxEndToken()<CR>
    set commentstring=//\ %s
endfunction

function TwoSpaceSettings()
    call SetMyTheme()
    setlocal tabstop=2
    setlocal softtabstop=2
    setlocal shiftwidth=2
    setlocal expandtab
    call MapCommentatorQuickKey()
endfunction

function MakefileSettings()
    call SetMyTheme()
    setlocal tabstop=4
    setlocal softtabstop=4
    setlocal shiftwidth=4
    setlocal noexpandtab
    set dictionary+=~/.vim/dictionary/make.txt
    " Put in a couple of common completions
"    imap <buffer> ( ()<C-O>i
"    imap <buffer> { {}<C-O>i
endfunction

function MarkdownSettings()
    call WritingSettings()
    call MapCommentatorQuickKey()
    set commentstring=<!--\ %s\ -->
endfunction

function WritingSettings()
  call SetWritingTheme()
  " Why doesn't this load by default in gvim?
  syntax region potionString start=/\v"/ end=/\v"/
  highlight link potionString String
  "hi String guifg=#ffff00
  " hide line numbers
  set nonumber
  setlocal wrap
  setlocal spell spelllang=en_us
  setlocal nonumber
endfunction

func! WordProcessorSettings()
  call SetWritingTheme()
  " Don't break a line after a one-letter word.  It's broken before it instead (if possible).
  "setlocal formatoptions=1 
  " Use physical tabs instead of spaces.
  setlocal noexpandtab
  setlocal spell spelllang=en_us 
  set thesaurus+=~/.vim/thesaurus/mthesaur.txt
  set complete+=s
  " Replace Vim's default formatter with par (must be installed)
  "set formatprg=par
  setlocal wrap 
  setlocal linebreak
  setlocal showbreak=+
  " Fix common spelling mistakes
  abbr Accross Across
  abbr Im I'm
  abbr Teh The
  abbr Weve We've
  abbr Wouldnt Wouldn't
  abbr accross across
  abbr floding folding
  abbr shouldnt shouldn't
  abbr shouldve should've
  abbr teh the
  abbr thats that's
  abbr weve we've
  abbr wouldnt wouldn't
  abbr wouldve would've
endfu
com! WP call WordProcessorSettings()

function RubySettings ()
    call TwoSpaceSettings()
    set dictionary+=~/.vim/dictionary/ruby.txt
    let g:rsenseUseOmniFunc=1

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

function FormatDBMigration ()
"  Align :[a_zA_Z_,]*
"  :s/  *$//
endfunction

"
" Try to do some magic with the HOME key, toggling between col 1 and first
" character on line.
"
function ISpecialHomeKey()
    if col('.') == 1
      normal! ^
    else
      normal! 0
    endif
endfunction
inoremap <silent> <home> <c-o>:call ISpecialHomeKey()<CR>
noremap <silent> <home> :call ISpecialHomeKey()<CR>

" Automagically change directories to the currently selected buffer.
if exists('+autochdir')
    " Great!  It's supported!
    set autochdir
else
    " If autochdir is not supported, try this shameless hack.
    autocmd BufEnter * sil! lcd %:p:h:gs/ /\\ /g
endif
