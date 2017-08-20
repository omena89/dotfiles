call plug#begin('~/.vim/plugged')

	Plug 'powerline/powerline', { 'rtp': 'powerline/bindings/vim' }
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

call plug#end()


filetype on
filetype plugin indent on
filetype plugin on
syntax on

let g:notes_directories = ['~/ownCloud/Notizen/']

" execute pathogen#infect()
"let g:airline_theme='gruvbox'
let g:airline_powerline_fonts=1

let g:ycm_confirm_extra_conf=0
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
let g:ycm_add_preview_to_completeopt=0
set completeopt-=preview

set laststatus=2
set noshowmode

set showcmd
set ignorecase
set smartcase
set expandtab
set smarttab
set hlsearch
set number
set noswapfile
set cursorline
set autoindent

set shiftwidth=4
set softtabstop=4
set scrolloff=8
set sidescrolloff=10

set timeoutlen=1000
set ttimeoutlen=0

" for cross-terminal clipboard support
set clipboard=unnamed
set clipboard^=unnamedplus

:noremap / :set hlsearch<CR>/


" for code in {0..255}; do echo -e "\e[38;05;${code}m $code: Test"; done
" colorscheme airblader

let g:gruvbox_contrast_dark='neutral'
colorscheme gruvbox
set background=dark
"hi Normal ctermfg=222 ctermbg=236

function TrimWhitespace()
  %s/\s*$//
  ''
:endfunction
command! Trim call TrimWhitespace()

" Shows the highlight group of whatever's under the cursor
 map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
 \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
 \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

set hidden
let mapleader=","
let maplocalleader=","
nmap <leader>n :enew<cr>
nmap <leader><leader> :bnext<CR>
nmap <leader>. :bprevious<CR>
nmap <leader>l :ls<CR>


" aktiviere die Maus
set mouse=a

set guifont=Anonymous\ Pro\ 15

set clipboard+=unnamedplus

let g:go_highlight_types = 1



" Ab hier Einstellungsmöglichkeiten zur Autovervollständigung
let g:acp_enableAtStartup = 0
" Use neocomplete.
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
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'


" Spezielle F Tasten Belegungen
"
:noremap <F2> :set paste! nopaste?<CR>
" toggle number lines
:noremap <F3> :set nonumber! nonumber?<CR>
" toggle search highlights
:noremap <F4> :set hlsearch! hlsearch?<CR>

nmap <F5> :!~/Projects/goPicture/start.sh <CR> :redraw! <CR>
nmap <F6> :BufExplorerHorizontalSplit<CR>
nmap <F7> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
