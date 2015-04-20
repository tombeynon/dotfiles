set nocompatible                " choose no compatibility with legacy vi
filetype off                  " required
 
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Helpers and bindings
Plugin 'tpope/vim-unimpaired.git'

" NERDTree
Plugin 'scrooloose/nerdtree.git'

" Ctrl-P
Plugin 'kien/ctrlp.vim.git'

" Unified navigation in tmux and vim
Plugin 'christoomey/vim-tmux-navigator'

" Git
Plugin 'tpope/vim-fugitive'

" Rails and Bundler
Plugin 'tpope/vim-rails.git'
Plugin 'tpope/vim-bundler.git'
Plugin 'thoughtbot/vim-rspec'

" Solarized theme
Plugin 'altercation/vim-colors-solarized'

" Airline statusbar
Plugin 'bling/vim-airline'
Plugin 'weynhamz/vim-plugin-minibufexpl'
Plugin 'edkolev/tmuxline.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.    
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
set hidden
set lazyredraw                  " Don't update the display while executing macros
set showmode                    " At least let yourself know what mode you're in
set wildmenu                    " Enable enhanced command-line completion
set number                      " always show line numbers
set noswapfile                  " Git handles version controlling

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode
 
"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

"" Airline
set laststatus=2
let g:tmuxline_powerline_separators = 0 " disable powerline seperators

"" Ctrl-P
set runtimepath^=~/.vim/bundle/ctrlp.vim

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

"" Solarized theme
set background=dark
colorscheme solarized

let mapleader=","

nmap <silent> <leader>ev :e $MYVIMRC<cr>
nmap <silent> <leader>sv :so $MYVIMRC<cr>

map <C-e> :NERDTreeToggle<CR>
