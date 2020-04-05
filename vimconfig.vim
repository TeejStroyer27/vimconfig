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
" COC
"----------------------------------------------------------------------------------

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
  Plug 'airblade/vim-gitgutter'            "git gutter symbols
  Plug 'tomasiser/vim-code-dark'           "colorscheme
  Plug 'bling/vim-airline'
  Plug 'dart-lang/dart-vim-plugin'         "Dart Language support
  Plug 'mxw/vim-jsx'
  Plug 'itchyny/lightline.vim'
  Plug 'lilydjwg/colorizer'
  Plug 'luochen1990/rainbow'               "Rainbow Braces
  Plug 'sheerun/vim-polyglot'
  Plug 'neoclide/coc.nvim', {'branch': 'release', 'tag': '*', 'do': { -> coc#util#install()}}
call plug#end()

let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let g:rainbow_active=1
let g:airline_theme = 'codedark'
let g:coc_global_extensions=['coc-omnisharp', 'coc-emoji', 'coc-eslint', 'coc-prettier', 'coc-tsserver', 'coc-tslint', 'coc-tslint-plugin', 'coc-css', 'coc-json', 'coc-pyls', 'coc-yaml', 'coc-python']

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

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
set t_Co=256
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
nmap <leader>e :Lexplore<Enter>

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COC 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hidden   " if hidden is not set, TextEdit might fail.
set nobackup " Some servers have issues with backup files, see #649
set nowritebackup
set cmdheight=2    " Better display for messages
set updatetime=300 " You will have bad experience for diagnostic messages when it's default 4000.
set shortmess+=c   " don't give |ins-completion-menu| messages.
set signcolumn=yes " always show signcolumns

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
autocmd CursorHold * silent call CocActionAsync('highlight')
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)
" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)
" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
