" Install plugin manager if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Install missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source ~/.vimrc
\| endif

" Define plugins
call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'psliwka/vim-smoothie'
Plug 'dylanaraps/wal.vim'
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
call plug#end()

" Enable syntax highlighting
syntax on

" Only perform case-sensitive searches when the search string contains a capitalized letter
set ignorecase
set smartcase

" Highlight all matches when searching
set hlsearch

" Display matches while search string is still being typed
set incsearch

" Stop searching when reaching the end or start of a file
set nowrapscan

" Show both relative and absolute line numbers
set number relativenumber
 
" Indentation preferences
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
