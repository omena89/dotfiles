
call plug#begin()
Plug 'preservim/nerdtree'
Plug 'jlanzarotta/bufexplorer'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'rainglow/vim'
Plug 'jacoborus/tender.vim'
call plug#end()

nmap <F6> :BufExplorerHorizontalSplit<CR>
nmap <F7> :NERDTreeToggle<CR>

set number
set linespace=3
"set guifont=Fira\ Code:h12
set cursorline
set termguicolors

"colorscheme gloom-contrast
colorscheme tender


set hidden
set laststatus=2
set noshowmode
set mouse=a
set showcmd
set ignorecase
set completeopt-=preview

set smartcase
set expandtab
set smarttab
set hlsearch

set noswapfile
set cursorline
set autoindent
set shiftwidth=4
set softtabstop=4
set scrolloff=8

set sidescrolloff=10
set timeoutlen=1000
set ttimeoutlen=0

let mapleader=","
let maplocalleader=","

nmap <leader>n :enew<cr>
nmap <leader><leader> :bnext<CR>
nmap <leader>. :bprevious<CR>
nmap <leader>l :ls<CR>

let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/](.git|.hg|.svn|node_modules)$',
            \ 'file': '\v\.(exe|so|dll)$',
            \ 'link': 'some_bad_symbolic_links',
            \ 'node' : 'node_modules$',
            \ }

