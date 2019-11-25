"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Table Of Contents - Sorted Alphabetically SORTA
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
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
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
  Plug 'OmniSharp/omnisharp-vim'           "Dot Net Server
  Plug 'Xuyuanp/nerdtree-git-plugin'       "file explorer git symbols
  Plug 'airblade/vim-gitgutter'            "git gutter symbols
  Plug 'cocopon/iceberg.vim'               "colorscheme
  Plug 'morhetz/gruvbox'                   "colorscheme
  Plug 'dart-lang/dart-vim-plugin'         "Dart Language support
  Plug 'itchyny/lightline.vim'
  Plug 'lilydjwg/colorizer'
  Plug 'luochen1990/rainbow'               "Rainbow Braces
  Plug 'scrooloose/nerdtree'               "file explorer
  Plug 'valloric/youcompleteme', { 'do': './install.py' }
  Plug 'w0rp/ale'                          "linter
call plug#end()

let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let g:OmniSharp_highlight_types = 2
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_timeout = 3
let g:rainbow_active=1
let g:solarized_termcolors=256

let ycm_trigger_key = '<C-n>'
" disable auto_triggering ycm suggestions pane and instead
" use semantic completion only on Ctrl+n
let ycm_trigger_key = '<C-n>'
let g:ycm_auto_trigger = 1
let g:ycm_key_invoke_completion = ycm_trigger_key

" this is some arcane magic to allow cycling through the YCM options
" with the same key that opened it.
" See http://vim.wikia.com/wiki/Improve_completion_popup_menu for more info.
let g:ycm_key_list_select_completion = ['<TAB>', '<C-j>']
inoremap <expr> ycm_trigger_key pumvisible() ? "<C-j>" : ycm_trigger_key;

"ale
let g:ale_linters = { 'cs': ['OmniSharp'] }
let g:ale_fix_on_save = 1 " fix files on save
let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_delay = 1000 " lint after 1000ms after changes are made both on insert mode and normal mode
"let g:ale_sign_error = '✗\ '
"let g:ale_sign_warning = '⚠\ ' " use nice symbols for errors and warnings
let g:ale_fixers = { '*': ['remove_trailing_lines', 'trim_whitespace'], } " fixer configurations

augroup omnisharp_commands
    autocmd!
    " Show type information automatically when the cursor stops moving
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8
set autoread       " Set to auto read when a file is changed from the outside
set ff=unix        " Set File Format to unix (windows can open unix file endings)
set history=500    " Sets how many lines of history VIM has to remember
set mouse=a
set nocompatible
set noswapfile
set conceallevel=0 " Prevents hiding of quotes in json
set backspace=indent,eol,start
set laststatus=2
set conceallevel=0 " Prevents hiding of quotes in json

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme gruvbox
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
nnoremap <Space> <NOP>
let mapleader ="\<Space>"
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
nmap <Leader>f :NERDTreeToggle<Enter>
nmap <silent> <Leader>v :NERDTreeFind<CR>

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
set tabstop=2     " Visual spaces per tab

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UI Config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype indent on
filetype plugin on
set completeopt=menuone,noinsert,noselect,preview
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
