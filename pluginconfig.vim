"Plugins
call plug#begin('~/.vim/plugged')
  Plug 'itchyny/lightline.vim'
  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'airblade/vim-gitgutter'
  Plug 'yggdroot/indentline'
  Plug 'altercation/vim-colors-solarized'
  Plug 'lilydjwg/colorizer'
  Plug 'luochen1990/rainbow'
call plug#end()

"Plugin-Configuration
set laststatus=2
map <C-o> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let g:solarized_termcolors=256
let g:rainbow_active=1
