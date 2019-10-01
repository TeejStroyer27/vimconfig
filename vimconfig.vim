"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Table Of Contents - Sorted Alphabetically SORTA
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
" Colors
" Folding
" Mappings
" Searching
" Spaces And Tabs
" UI Config
" xTerminal
"----------------------------------------------------------------------------------

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoread       " Set to auto read when a file is changed from the outside
set ff=unix        " Set File Format to unix (windows can open unix file endings)
set history=500    " Sets how many lines of history VIM has to remember
set mouse=a
set nocompatible
set noswapfile
set conceallevel=0 " Prevents hiding of quotes in json
set backspace=indent,eol,start
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" colorscheme iceberg "Add this to root vimrc that sources vimrc with plugin
syntax enable
set background=dark

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldenable        " Enables folding
set foldlevelstart=10 " Open Most Folds by Default
set foldmethod=indent " Fold based on indention
set foldnestmax=10    " Nested Fold Max

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader ="\<Space>"
nnoremap <Space> <NOP>
imap jj <Esc>
nmap <Leader>y "*y
nmap <Leader>Y "+y
nmap <Leader>p "*p
nmap <Leader>P "+p
xmap <Leader>y "*y
xmap <Leader>Y "+y
xmap <Leader>p "*p
xmap <Leader>P "+p
tnoremap <Esc> <C-\><C-n>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Searching
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch    " Highlight matches
set ignorecase
set incsearch   " Search as characters are entered
set smartcase

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spaces And Tabs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab     " Tabs are spaces
set expandtab     " Tabs are spaces
set shiftwidth=2
set softtabstop=2 " Number of spaces in tab when editing
set tabstop=2   " Visual spaces per tab

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UI Config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype indent on
filetype plugin on 
set completeopt=longest,menuone,preview
set cursorline     " Highlight line youre cursor is on
set lazyredraw     " Redraws screen only when it matters
set nowrap         " Doesn't wrap lines
set number         " Show Line numbers
set previewheight=5
set showcmd        " Show Command in bottom bar
set showmatch      " Highlight matching [{()}]
set wildmenu       " Visual autocomplete for command menu

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" xTerminal
" Copy To Vimrc Where Sourcing
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Windows
"let &t_ti.='\e[1 q'
"let &t_SI.='\e[5 q'
"let &t_EI.='\e[1 q'
"let &t_te.='\e[0 q'

"Ubuntu
"let &t_SI = "\e[6 q"
"let &t_EI = "\e[2 q"

"MacOs and ITerm
"let &t_SI ='\<Esc>]50;CursorShape=1\x7'
"let &t_SR ='\<Esc>]50;CursorShape=2\x7'
"let &t_EI ='\<Esc>]50;CursorShape=0\x7'
