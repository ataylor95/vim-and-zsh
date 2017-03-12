set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"NerdTree
Plugin 'scrooloose/nerdtree'
"Syntax checker
Plugin 'scrooloose/syntastic'
"Colour Schemes
Plugin 'flazz/vim-colorschemes'
"Tag bar for quickly looking around
Plugin 'majutsushi/tagbar'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
"  Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" ===========================================================
"                Setting up editor options
" ===========================================================

colorscheme seoul256

" NERDTree autoopen etc
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

" set line numbers open automatically
set number

" buffer opts
set autoread
set autowrite

" display opts
set number
set title

" tab opts
set autoindent
set smartindent
set expandtab
set ts=4 sts=4 sw=4

set history=400

" search opts
set hlsearch
set ignorecase
set smartcase
set incsearch

" ===========================================================
"                   Ignore In NerdTree
" ===========================================================
let NERDTreeIgnore = ['*.swp']

" ===========================================================
"                      Key Bindings
" ===========================================================

" for common :w mis-spellings
:command WQ wq
:command Wq wq
:command W w
:command Q q
:command Qa qa

set pastetoggle=<F4>
nnoremap <silent> <F3> :NERDTreeToggle<CR>
nnoremap <silent> <F2> :TagbarToggle<CR>
nnoremap <silent> <F7> :set number<CR>

imap jk <ESC>

"Can search on visually selected text with // .
vnoremap // y/<C-R>"<CR>

" ===========================================================
"                      Custom Functions
" ===========================================================

function ToggleLineNumbers()
    if (&relativenumber == 1)
        set norelativenumber
        echom "Absolute Line Numbers"
    else
        set relativenumber
        echom "Relative Line Numbers"
    endif
endfunction

function ToggleTabSpaces()
    if (&sts > 3)
        set ts=2 sts=2 sw=2
        echom "2 Spaces For Tabs"
    else
        set ts=4 sts=4 sw=4
        echom "4 Spaces For Tabs"
    endif
endfunction

" ===========================================================
"               Key Bindings for Custom Functions
" ===========================================================

nmap <F8>       :call ToggleLineNumbers() <CR>
imap <F8> <ESC> :call ToggleLineNumbers() <CR>i

nmap <F9>       :call ToggleTabSpaces() <CR>
imap <F9> <ESC> :call ToggleTabSpaces() <CR>i
