" #######################################################################################
" .vimrc
" Michael Heinrich-Bloch
" 16.03.2018
" #######################################################################################

" #######################################################################################
" Plugins
" #######################################################################################
call plug#begin('~/.vim/plugged')
    Plug 'morhetz/gruvbox' " colorscheme
    Plug 'scrooloose/nerdtree' " Filebrowser
    Plug 'tpope/vim-surround' " markierungen mit S + Zeichenkette umgeben
    Plug 'Raimondi/delimitMate' " klammern automatisch schließen
    Plug 'jceb/vim-orgmode' "Vim-Org Mode
    Plug 'tpope/vim-speeddating' "Eine Abhängigkeit für vim-orgmode
    Plug 'mattn/calendar-vim' "Eine Abhängigkeit für vim-orgmode
    Plug 'majutsushi/tagbar' "Eine Abhängigkeit für vim-orgmode
    Plug 'jlanzarotta/bufexplorer'
    Plug 'fatih/vim-go'
    Plug 'Shougo/neocomplete.vim' "autocompletion golang
    Plug 'godlygeek/tabular'
    Plug 'plasticboy/vim-markdown'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'scrooloose/nerdcommenter'
    Plug 'lervag/vimtex'
    Plug 'xolox/vim-misc'
    Plug 'xolox/vim-notes'
    Plug 'tikhomirov/vim-glsl'
    Plug 'leafgarland/typescript-vim'
    Plug 'Quramy/tsuquyomi'
    Plug 'kien/ctrlp.vim'
    Plug 'MattesGroeger/vim-bookmarks'
    Plug 'hyiltiz/vim-plugins-profile'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'edkolev/tmuxline.vim'
call plug#end()


" #######################################################################################
" Notes
" #######################################################################################
let g:notes_directories = ['~/ownCloud/Notizen/']


" #######################################################################################
" Airline
" #######################################################################################
let g:airline_powerline_fonts=1
"let g:ycm_confirm_extra_conf=0
"let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
"let g:ycm_add_preview_to_completeopt=0
let g:airline_theme='angr'


" #######################################################################################
" General Settings
" #######################################################################################
let mapleader=","
let maplocalleader=","

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
set number
"set number relativenumber

set noswapfile
set cursorline
set autoindent
set shiftwidth=4
set softtabstop=4
set scrolloff=8

set sidescrolloff=10
set timeoutlen=1000
set ttimeoutlen=0


" #######################################################################################
" Synthax Highlighting
" #######################################################################################
filetype on
filetype plugin indent on
filetype plugin on
syntax on
let g:go_highlight_types = 1


" #######################################################################################
" Cross-Terminal Support
" #######################################################################################
set clipboard=unnamed
set clipboard^=unnamedplus
set guifont=Anonymous\ Pro\ 15
set clipboard+=unnamedplus


" #######################################################################################
" Folding
" #######################################################################################
set foldlevel=1
set foldmethod=indent
set nofoldenable


" #######################################################################################
" Theme
" #######################################################################################
let g:gruvbox_contrast_dark='neutral'
colorscheme gruvbox
set background=dark
hi Normal ctermfg=222 ctermbg=NONE


" #######################################################################################
" Bookmarks
" #######################################################################################
let g:bookmark_sign = '♥'
let g:bookmark_highlight_lines = 1

function TrimWhitespace()
    %s/\s*$//
    ''
endfunction

command! Trim call TrimWhitespace()

" Shows the highlight group of whatever's under the cursor
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
            \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
            \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

nmap <leader>n :enew<cr>
nmap <leader><leader> :bnext<CR>
nmap <leader>. :bprevious<CR>
nmap <leader>l :ls<CR>

let g:acp_enableAtStartup = 0

" ctrlp - ignore path
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/](.git|.hg|.svn|node_modules)$',
            \ 'file': '\v\.(exe|so|dll)$',
            \ 'link': 'some_bad_symbolic_links',
            \ 'node' : 'node_modules$',
            \ }


" #######################################################################################
" Omni Completion & Neocomplete
" #######################################################################################
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
            \ 'default' : '',
            \ 'vimshell' : $HOME.'/.vimshell_hist',
            \ 'scheme' : $HOME.'/.gosh_completions'
            \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif

" NeoComplete
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'


" #######################################################################################
" Key-Bindings/Mapping
" #######################################################################################
:noremap <F2> :set paste! nopaste?<CR>
:noremap <F3> :set nonumber! nonumber?<CR>
:noremap <F4> :set hlsearch! hlsearch?<CR>
:noremap / :set hlsearch<CR>/

nmap <F6> :BufExplorerHorizontalSplit<CR>
nmap <F7> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>

inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
endfunction

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

