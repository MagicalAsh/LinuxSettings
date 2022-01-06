"
" .vimrc
"
" Vim configuration resource file.  Specifies desired
" behavior for the vim editor.
"

"
" Do some magic to get vim to do colors for terminal
" type 'xterm'.  Note these contain control characters.
"
if &term =~ "xterm"
    if has("terminfo")
        set t_Co=8
        set t_Sf=p1%dm
        set t_Sb=p1%dm
    else
        set t_Co=8
        set t_Sf=dm
        set t_Sb=dm
    endif
endif

:set modeline          " Tell vim to look for a line in the file to
                       "     override settings (like tab stops)
:set showmode          " Tell you if you're in insert mode
:set tabstop=4         " Set the tabstop to 4 spaces
:set shiftwidth=4      " Shiftwidth should match tabstop
:set expandtab         " Convert tabs to <tabstop> number of spaces
:set nowrap            " Do not wrap lines longer than the window
:set nowrapscan        " Do not wrap to the top of the file while searching
:set ruler             " Show the cursor position all the time
:set showmatch         " Show matching [] () {} etc...
:set smartindent       " Let vim help you with your code indention
:set nohlsearch        " Don't highlight strings you're searching for
:set formatoptions+=ro " Automatically insert the comment character when
                       "     you hit <enter> (r) or o/O (o) in a block comment
:set backspace=2       " Makes backspace work like you expect
:set report=0          " When doing substitutions, report the number of changes
:set background=dark   " Tell vim my background color is dark, so set
                       "     the colors appropriately
:set report=0          " When doing substitutions, report the number of changes
:set wildmenu          " Show menu on double-tab command completion
:set wildmode=list:longest,full " Control how 'wildmenu' things are listed
:set colorcolumn=100   " Highlight the 80th column -- help prevent long lines
:set cinoptions+=j1    " Format Java anonymous inner classes correctly.
:set belloff=all       " Disables the damn beeping
:set incsearch         " Search after every keystroke
:set hlsearch          " Highlight search results
:set splitbelow        " Forces split to open new window on bottom
:set splitright        " Forces vsp to open new window on right

:map <S-Enter>  O<ESC>
:map <Enter>    o<ESC>


:map <S-Enter>  O<ESC>
:map <Enter>    o<ESC>


"
" Switch syntax highlighting on, when the terminal can support colors
"
if &t_Co > 2 || has("gui_running")
    :syntax on
    "
    " Change the highlight color for Comment and Special
    " to Cyan.  Blue is too dark for a black background.
    "
    :highlight Comment  term=bold ctermfg=cyan guifg=cyan
    :highlight Special  term=bold ctermfg=cyan guifg=cyan
    :highlight Constant term=bold ctermfg=red  guifg=cyan
endif
:set background=dark


"
" Make vim turn *off* expandtab for files named Makefile or makefile
" We need the tab literal
"
:autocmd BufNewFile,BufRead [Mm]akefile* set noexpandtab


"
" Make vim recognize a file ending in ".template" be a C++ source file
"
:autocmd BufNewFile,BufRead *.template set filetype=cpp


"
" Make vim recognize # as a start-of-comment token in assembly source files
"
:autocmd BufNewFile,BufRead *.s syn match asmComment "#"


"
" Make vim wrap e-mail text at 75 characters
"
:autocmd FileType mail set textwidth=75
