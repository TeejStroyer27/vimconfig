"Plugins
call plug#begin('~/.vim/plugged')
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'airblade/vim-gitgutter'
  Plug 'cocopon/iceberg.vim'
  Plug 'itchyny/lightline.vim'
  Plug 'lilydjwg/colorizer'
  Plug 'luochen1990/rainbow'
  Plug 'scrooloose/nerdtree'
  Plug 'dart-lang/dart-vim-plugin'
call plug#end()

"Plugin-Configuration
let NERDTreeShowHidden=1
let g:rainbow_active=1
let g:solarized_termcolors=256
nnoremap <Leader>f :NERDTreeToggle<Enter>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>
set laststatus=2
set conceallevel=0 " Prevents hiding of quotes in json
