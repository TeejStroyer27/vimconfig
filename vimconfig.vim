"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Table Of Contents - Sorted Alphabetically SORTA
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
  Plug 'Xuyuanp/nerdtree-git-plugin'       "file explorer git symbols
  Plug 'airblade/vim-gitgutter'            "git gutter symbols
  Plug 'tomasiser/vim-code-dark'           "colorscheme
  Plug 'bling/vim-airline'
  Plug 'dart-lang/dart-vim-plugin'         "Dart Language support
  Plug 'mxw/vim-jsx'
  Plug 'pangloss/vim-javascript'
  Plug 'itchyny/lightline.vim'
  Plug 'lilydjwg/colorizer'
  Plug 'luochen1990/rainbow'               "Rainbow Braces
  Plug 'scrooloose/nerdtree'               "file explorer
  Plug 'valloric/youcompleteme', { 'do': './install.py --all --system-libclang' }
call plug#end()

let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let g:rainbow_active=1
let ycm_trigger_key = '<C-n>'
let g:airline_theme = 'codedark'
let g:ycm_auto_trigger = 1
let g:ycm_min_num_of_chars_for_completion = 0
let g:ycm_min_num_identifier_candidate_chars = 0
let g:ycm_max_num_candidates = 50
let g:ycm_max_num_identifier_candidates = 10
let g:ycm_filetype_whitelist = {'*': 1}
let g:ycm_show_diagnostics_ui = 1
let g:ycm_error_symbol = '!!'
let g:ycm_warning_symbol = '??'
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 1
let g:ycm_echo_current_diagnostic = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_always_populate_location_list = 1
let g:ycm_auto_start_csharp_server = 1
let g:ycm_auto_stop_csharp_server = 1
let g:ycm_csharp_server_port = 0
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_disable_for_files_larger_than_kb = 1000
let g:ycm_key_invoke_completion = ycm_trigger_key
let g:ycm_key_list_select_completion = ['<TAB>', '<C-j>']
inoremap <expr> ycm_trigger_key pumvisible() ? "<C-j>" : ycm_trigger_key;

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoread       " Set to auto read when a file is changed from the outside
set backspace=indent,eol,start
set conceallevel=0 " Prevents hiding of quotes in json
set encoding=utf-8
set ff=unix        " Set File Format to unix (windows can open unix file endings)
set guifont=Menlo\ Regular:h14
set history=500    " Sets how many lines of history VIM has to remember
set laststatus=2
set mouse=a
set nocompatible
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme codedark
set background=dark
syntax enable

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
retab
set expandtab     " Tabs are spaces
set shiftwidth=2  " Number space characters for indentation
set smarttab
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
