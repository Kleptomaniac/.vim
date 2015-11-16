""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -- Boombox .vimrc --
"
" Maintainer: Matthew McNally
" Version: 1.0
" Last Revision: 17/11/15
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -- General Vim Settings --
""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable filetype plugins
filetype plugin on
filetype indent on

" Automatically read changes made oustide editor
set autoread

" Leader key to be used in custom
" Boombox commands - '.' key
let mapleader = "."

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

" Enable wildmenu (tab auto-completion)
set wildmenu

" Ensure status line always visible
set laststatus=2

" Format the status line
set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ %l,\ %c

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -- Vim Themes and Colours --
""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable syntax highlighting
syntax enable

" Forces Vim to display with 256 bit 
" colour pallette
if has('unix')
    set t_Co=256
endif

" Set colour theme to Boombox (colors 
" directory)
colorscheme boombox
set background=dark

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" -- Indent Settings --
"""""""""""""""""""""""""""""""""""""""""""""""""""""

" Tabs are comprised of spaces
set expandtab

" Tabs backspace, shift, etc. correctly
set smarttab

" Tabs should be 4 spaces long by default
set shiftwidth=4
set tabstop=4
set softtabstop=4  

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" -- Key Remapping --
"""""""""""""""""""""""""""""""""""""""""""""""""""""

"map <leader>tn

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" -- Tab and Window Settings --
"""""""""""""""""""""""""""""""""""""""""""""""""""""

" Specify buffer switching behaviour and
" ensure tabline is permanently shown 
try
    set switchbuf=useopen,usetab,newtab
    set stal=2
catch
endtry

" Return to last edit position when opening files
" Ignored given buffer is a git commit message
" Sourced from Robert Wahler at 
" http://stackoverflow.com/a/4348480
function! ReadBufferCursorPos()
    if !(bufname("%") =~ '\(COMMIT_EDITMSG\)') && line("'\"") > 1 && line("'\"") <= line("$")
        exe "normal! g`\""
    endif
endfunction
au BufReadPost * call ReadBufferCursorPos()

" Remember info about open buffers on close
set viminfo^=%
