""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -- Boombox .vimrc --
"
" Maintainer: Matthew McNally
" Version: 1.0
" Last Revision: 17/11/15
"
" Heavily modified from the .vimrc file provided by 
" Amir Salihefendic at https://amix.dk/vim/vimrc.html
"
" Other snippets of code found from external
" sources are referenced individually
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -- General Vim Settings --
""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Establish how many lines of history Vim should store
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on

" Automatically read changes made oustide editor
set autoread

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -- Vim Backup Settings --
""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Disable backup and swapfile functionality
set nobackup
set nowb
set noswapfile

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -- Vim UI Features --
""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Height of command line bar
set cmdheight=2

" Enable line numbering
set number

" Ensure current position always shown
set ruler

" Ensure status line always visible
set laststatus=2

" Format the status line 
" (filename, working dir, line, col)
set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %{getcwd()}\ \ \ %l,\ %c

" Enable wildmenu (tab auto-completion)
set wildmenu

" Ignore certain files in autocompletion
" (encoded files, compilation files)
set wildignore=.git,*.o,*~,*.swp,*.jpg,*.png,*.gif,*.pdf,*.pyc
" Ensure binary files (no suffix) are less preferable
set suffixes+=,

" Buffer becomes hidden when abandoned
set hidden

" Disable warning bells on error
set noerrorbells
set novisualbell
set t_vb=

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -- Vim Themes, Colours, Fonts --
""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable syntax highlighting
syntax enable

" Forces Vim to display with 256 bit 
" colour pallette in Unix
if has('unix')
    set t_Co=256
endif

" Set GUI-friendly properties for GVim
if has('gui_running')
    set t_Co=256
    " Ensure tab line correctly displayed
    set guioptions+=e
    " Disable toolbar display
    set guioptions-=T
    
    set guitablabel=%M\ %t

    " Set font for GVim
    " Windows specific currently
    if has('gui_win32')
        set guifont=Consolas:h10:cANSI
    endif
endif

" Set colour theme to Boombox (colors 
" directory)
colorscheme boombox
set background=dark

" Ensure UTF8 is standard character encoding 
" and en_US is standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" -- Motion Settings --
"""""""""""""""""""""""""""""""""""""""""""""""""""""

" Minimum number of lines visible above and
" below cursor when scrolling
set scrolloff=8

" Ensure backspace works correctly over certain
" indents and linebreaks
set backspace=eol,start,indent

" Ensure cursor moves to next line when
" end reached with arrow keys
set whichwrap+=<,>,[,]

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" -- Indent/Text-Wrap Settings --
"""""""""""""""""""""""""""""""""""""""""""""""""""""

" Tabs are comprised of spaces
set expandtab

" Tabs backspace, shift, etc. correctly
set smarttab

" Tabs should be 4 spaces long by default
set shiftwidth=4
set tabstop=4
set softtabstop=4

" Automatically/intelligently indent lines
set autoindent
set cindent

" Wrap text at the ends of full words after
" 200 characters
set wrap
set linebreak
set textwidth=300

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" -- Search/Macro Settings --
"""""""""""""""""""""""""""""""""""""""""""""""""""""

" Ignore case when searching
set ignorecase

" Override ignorecase if search string contains
" uppercase (other smarter search strategies) 
set smartcase

" Highlight search results
set hlsearch

" Jump to results as search string is formed
set incsearch

" Disable redraw while executing macros
set lazyredraw

" Enable magic regular expressions
set magic

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" -- Tab and Window Settings --
"""""""""""""""""""""""""""""""""""""""""""""""""""""

" Specify buffer switching behaviour and
" ensure tabline is permanently shown 
try
    set switchbuf=useopen,usetab,newtab
    set showtabline=2
catch
endtry

" Return to last edit position when opening files
" Ignored given buffer is a git commit message
" Sourced from Robert Wahler at 
" http://stackoverflow.com/a/4348480
function! ReadBufferCursorPos()
    if !(bufname("%") =~ '\(COMMIT_EDITMSG\)') && line("'\"") > 1 && line("'\"") <= line("$")
        execute "normal! g`\""
    endif
endfunction
autocmd BufReadPost * call ReadBufferCursorPos()

" Remember info about open buffers on close
set viminfo^=%

" Open multiple tabs in a single invocation
" (supports wildcard)
" Sourced from Carpetsmoker at
" http://vi.stackexchange.com/a/2110
function! MultiTabedit(pattern_list)
    for p in a:pattern_list
        for c in glob(l:p, 0, 1)
            execute 'tabedit ' . l:c
        endfor
    endfor
endfunction
command! -bar -bang -nargs=+ -complete=file Te call MultiTabedit([<f-args>])

" Remap the tab movement keys
map ] gt
map [ gT

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" -- Key Remapping --
"""""""""""""""""""""""""""""""""""""""""""""""""""""

" Time in ms to wait for keycodes/commands
" to be input
set timeoutlen=500

" Leader key to be used in custom
" Boombox commands - '.' key
let mapleader = "."
