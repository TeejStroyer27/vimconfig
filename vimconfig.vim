""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"       (`-.           _   .-')                                       .-') _                                " 
"     _(OO  )_        ( '.( OO )_                                    ( OO ) )                               " 
" ,--(_/   ,. \ ,-.-') ,--.   ,--.)         .-----.  .-'),-----. ,--./ ,--,'    ,------.,-.-')   ,----.     " 
" \   \   /(__/ |  |OO)|   `.'   |         '  .--./ ( OO'  .-.  '|   \ |  |\ ('-| _.---'|  |OO) '  .-./-')  " 
"  \   \ /   /  |  |  \|         |         |  |('-. /   |  | |  ||    \|  | )(OO|(_\    |  |  \ |  |_( O- ) " 
"   \   '   /,  |  |(_/|  |'.'|  |        /_) |OO  )\_) |  |\|  ||  .     |/ /  |  '--. |  |(_/ |  | .--, \ " 
"    \     /__),|  |_.'|  |   |  |        ||  |`-'|   \ |  | |  ||  |\    |  \_)|  .--',|  |_.'(|  | '. (_/ " 
"     \   /   (_|  |   |  |   |  |       (_'  '--'\    `'  '-'  '|  | \   |    \|  |_)(_|  |    |  '--'  |  "
"      `-'      `--'   `--'   `--'          `-----'      `-----' `--'  `--'     `--'    `--'     `------'   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if !exists('g:vscode') 
  "-------- VIM-PLUG SETUP ----
  let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')
  if !filereadable(vimplug_exists)
    if has('win32')&&!has('win64')
      let curl_exists=expand('C:\Windows\Sysnative\curl.exe')
    else
      let curl_exists=expand('curl')
    endif
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
  "-------- END VIM-PLUG SETUP ----
  
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Plugins
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  call plug#begin('~/.vim/plugged')
  Plug 'airblade/vim-gitgutter'            "Git gutter symbols
  Plug 'lilydjwg/colorizer'                "Colors hex
  Plug 'gruvbox-community/gruvbox'         "Colorscheme
  Plug 'aloussase/cyberpunk'               "Colorscheme
  Plug 'luochen1990/rainbow'               "Rainbow Braces
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  "Improved Syntax Highlighting
  "LSP PLUGINS
  Plug 'OmniSharp/omnisharp-vim'           "C# LSP
  Plug 'neovim/nvim-lspconfig'             "LSP configuration
  Plug 'glepnir/lspsaga.nvim'              "Pretty auto complete UI
  Plug 'kosayoda/nvim-lightbulb'           "Code Action symbol
  "COMPLETION
  Plug 'nvim-lua/completion-nvim'
  call plug#end()

  let g:lsc_auto_map = v:true
  let g:rainbow_active=1

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " General
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "set encoding=utf-8
  "set ff=unix        " Set File Format to unix (windows can open unix file endings)
  "set hlsearch    " Highlight matches
  colorscheme cyberpunk
  filetype indent on
  filetype plugin on
  let g:airline_theme='cyberpunk'
  set autoread       " Set to auto read when a file is changed from the outside
  set background=dark
  set backspace=indent,eol,start
  set completeopt=menuone,noinsert,noselect,preview
  set conceallevel=0 " Prevents hiding of quotes in json
  set cursorline     " Highlight line youre cursor is on
  set expandtab     " Tabs are spaces
  set foldenable        " Enables folding
  set foldlevelstart=10 " Open Most Folds by Default
  set foldmethod=indent " Fold based on indention
  set foldnestmax=10    " Nested Fold Max
  set guifont=Menlo\ Regular:h14
  set history=500    " Sets how many lines of history VIM has to remember
  set ignorecase
  set inccommand=split " Live Preview When Searching/Replacing
  set incsearch   " Search as characters are entered
  set laststatus=2
  set lazyredraw     " Redraws screen only when it matters
  set mouse=a
  set nocompatible
  set noerrorbells
  set noswapfile
  set nowrap         " Doesn't wrap lines
  set number relativenumber         " Show Line numbers
  set previewheight=5
  set shiftwidth=2  " Number space characters for indentation
  set shortmess+=c
  set showcmd        " Show Command in bottom bar
  set showmatch      " Highlight matching [{()}]
  set smartcase
  set smarttab
  set softtabstop=2 " Number of spaces in tab when editing
  set t_Co=256
  set tabstop=2     " Visual spaces per tab
  set termguicolors
  set updatetime=50
  set wildmenu       " Visual autocomplete for command menu
  syntax enable

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Mappings
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  nnoremap <Space> <NOP>
  let mapleader ="\<Space>"
  nmap <leader>P "+p
  nmap <leader>Y "+y
  nmap <leader>e :Explore<Cr>
  nmap <leader>p "*p
  nmap <leader>y "*y
  xmap <leader>P "+p
  xmap <leader>Y "+y
  xmap <leader>p "*p
  xmap <leader>y "*y
  nmap <leader>j <C-W>j
  nmap <leader>k <C-W>k
  nmap <leader>h <C-W>h
  nmap <leader>l <C-W>l
  tnoremap <Esc> <C-\><C-n>

  " Use <Tab> and <S-Tab> to navigate through popup menu
  inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
  inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
  nnoremap <silent><leader>. <cmd>lua require('lspsaga.codeaction').code_action()<CR>
  vnoremap <silent><leader>. <cmd>'<,'>lua require('lspsaga.codeaction').range_code_action()<CR>
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

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " LSP
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  let g:vimsyn_embed= 'l' "lua highlightin in vim file
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

  local pid = vim.fn.getpid()
  local omnisharp_bin = "/usr/local/bin/omnisharp"
  nvim_lsp.omnisharp.setup{ cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) }; }
EOF

endif

