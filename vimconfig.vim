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
" LSP
"----------------------------------------------------------------------------------

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"-------- vim-plug setup ----
let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')
if has('win32')&&!has('win64')
  let curl_exists=expand('C:\Windows\Sysnative\curl.exe')
else
  let curl_exists=expand('curl')
endif

if !filereadable(vimplug_exists)
  if !executable(curl_exists)
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent exec "!"curl_exists" -fLo " . shellescape(vimplug_exists) . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"
  autocmd VimEnter * PlugInstall
endif
"-------- end vim-plug setup ----
set nocompatible

call plug#begin('~/.vim/plugged')
  Plug 'airblade/vim-gitgutter'            "git gutter symbols
  Plug 'lilydjwg/colorizer'                "colors hex
  Plug 'gruvbox-community/gruvbox'         "gruvbox
  Plug 'luochen1990/rainbow'               "Rainbow Braces
  Plug 'npxbr/glow.nvim', {'do': ':GlowInstall'} "Markdown Viewer

  "LSP PLUGINS
  Plug 'neovim/nvim-lspconfig'             "LSP configuration
  Plug 'glepnir/lspsaga.nvim'              "Pretty auto complete UI
  Plug 'kosayoda/nvim-lightbulb'           "Code Action symbol
  Plug 'anott03/nvim-lspinstall'           "LSP Installer
  Plug 'alexaandru/nvim-lspupdate'         "Auto Updates/Install Configured servers
  "COMPLETION
  Plug 'nvim-lua/completion-nvim'
call plug#end()

let g:lsc_auto_map = v:true
let g:rainbow_active=1

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
set noerrorbells
set noswapfile
set updatetime=50

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme gruvbox
set background=dark
set t_Co=256
if (has("nvim")||has("termguicolors"))
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
nmap <leader>e :Explore<Cr>
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Searching
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set hlsearch    " Highlight matches
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
set inccommand=split " Live Preview When Searching/Replacing
set lazyredraw     " Redraws screen only when it matters
set nowrap         " Doesn't wrap lines
set number relativenumber         " Show Line numbers
set previewheight=5
set shortmess+=c
set showcmd        " Show Command in bottom bar
set showmatch      " Highlight matching [{()}]
set wildmenu       " Visual autocomplete for command menu

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LSP
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimsyn_embed= 'l' "lua highlightin in vim file

if has('nvim')
"Use Completion in every Buffer
autocmd BufEnter * lua require'completion'.on_attach()

lua << EOF
  local saga = require 'lspsaga'
  saga.init_lsp_saga()
  --code action symbol
  vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]

  --Completion
  local servers = { "pyright", "rust_analyzer", "tsserver", "omnisharp", "clangd" }
  local nvim_lsp = require('lspconfig')
  for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {}
  end

EOF
endif


nnoremap <silent><leader>ca <cmd>lua require('lspsaga.codeaction').code_action()<CR>
vnoremap <silent><leader>ca <cmd>'<,'>lua require('lspsaga.codeaction').range_code_action()<CR>
"show hover doc
nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
nnoremap <silent> <C-f> <cmd>lua require('lspsaga.hover').smart_scroll_hover(1)<CR>
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.hover').smart_scroll_hover(-1)<CR>
" show signature help
nnoremap <silent> gs <cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>
" rename
nnoremap <silent>gr <cmd>lua require('lspsaga.rename').rename()<CR>
" preview definition
nnoremap <silent> gd <cmd>lua require'lspsaga.provider'.preview_definition()<CR>
" show
nnoremap <silent><leader>cd <cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>
" jump diagnostic
nnoremap <silent> [e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>
nnoremap <silent> ]e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>
" float terminal also you can pass the cli command in open_float_terminal function
nnoremap <silent> <Leader>ft <cmd>lua require('lspsaga.floaterm').open_float_terminal()<CR> 
tnoremap <silent> <Leader>ft <C-\><C-n>:lua require('lspsaga.floaterm').close_float_terminal()<CR>
