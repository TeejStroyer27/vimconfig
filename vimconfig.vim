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
" NEOVIM ONLY
"----------------------------------------------------------------------------------

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
  Plug 'airblade/vim-gitgutter'            "git gutter symbols
  Plug 'lilydjwg/colorizer'                "colors hex
  Plug 'gruvbox-community/gruvbox'         "gruvbox
  Plug 'luochen1990/rainbow'               "Rainbow Braces
  Plug 'neoclide/coc.nvim', {'branch': 'release', 'tag': '*', 'do': { -> coc#util#install()}}
call plug#end()

let g:rainbow_active=1
let g:coc_global_extensions=['coc-explorer','coc-omnisharp', 'coc-emoji', 'coc-eslint', 'coc-prettier', 'coc-tsserver', 'coc-tslint', 'coc-tslint-plugin', 'coc-css', 'coc-json', 'coc-pyls', 'coc-yaml', 'coc-python']

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
colorscheme gruvbox
set background=dark
set t_Co=256
if (has("termguicolors"))
  set termguicolors
endif
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
nmap <leader>y "*y
nmap <leader>Y "+y
nmap <leader>p "*p
nmap <leader>P "+p
xmap <leader>y "*y
xmap <leader>Y "+y
xmap <leader>p "*p
xmap <leader>P "+p
tnoremap <Esc> <C-\><C-n>
nmap <space>e :CocCommand explorer<CR>

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

let g:netrw_banner = 1
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 50 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NEOVIM ONLY
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('nvim')
  set inccommand=split " Live Preview When Searching/Replacing
endif
