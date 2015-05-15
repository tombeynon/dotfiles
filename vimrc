set nocompatible                " choose no compatibility with legacy vi
filetype off                  " required
 
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Helpers and bindings
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-unimpaired.git'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-eunuch.git'
Plugin 'godlygeek/tabular'

" HTML helpers
Plugin 'vim-scripts/HTML-AutoCloseTag'
Plugin 'gregsexton/MatchTag'

" Dispatch
Plugin 'tpope/vim-dispatch'

" Search
Plugin 'rking/ag.vim'
Plugin 'bronson/vim-visual-star-search'

" CTags
Plugin 'vim-scripts/AutoTag'

" NERDTree
Plugin 'scrooloose/nerdtree.git'

" Ctrl-P
Plugin 'kien/ctrlp.vim.git'

" SuperTab
Plugin 'ervandew/supertab'

" Unified navigation in tmux and vim
Plugin 'christoomey/vim-tmux-navigator'

" Git
Plugin 'tpope/vim-fugitive'

" Ruby, Rails and Bundler
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails.git'
Plugin 'tpope/vim-bundler.git'
Plugin 'thoughtbot/vim-rspec'

" Solarized theme
Plugin 'altercation/vim-colors-solarized'

" Airline statusbar
Plugin 'bling/vim-airline'
Plugin 'edkolev/tmuxline.vim'

" Buffers and windows
Plugin 'vim-scripts/bufkill.vim'
Plugin 'dr-chip-vim-scripts/ZoomWin'
Plugin 'schickling/vim-bufonly'

" Markdown
Plugin 'itspriddle/vim-marked'

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
set noshowmode                  " Airline shows the mode
set wildmenu                    " Enable enhanced command-line completion
set number                      " always show line numbers
set noswapfile                  " Git handles version controlling

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode
set cursorline                  " highlight cuurent line
 
"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

let mapleader=","

map § <Esc>
imap § <Esc>

nmap <silent> <leader>ev :e $MYVIMRC<cr>
nmap <silent> <leader>sv :so $MYVIMRC<cr>

map <silent> <C-e> :NERDTreeToggle<CR>
map <silent> <C-n> :CtrlPBuffer<CR>

"" Speed boost
nnoremap <Leader>w :w<CR>

"" System clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

"" Airline
set laststatus=2
let g:tmuxline_powerline_separators = 0 " disable powerline seperators

"" NERDTree
let NERDTreeQuitOnOpen = 1

"" Ctrl-P
set runtimepath^=~/.vim/bundle/ctrlp.vim

" RSpec.vim mappings
let g:rspec_runner = "os_x_iterm"
let g:rspec_command = 'Dispatch rspec {spec}'

map <Leader>rt :call RunCurrentSpecFile()<CR>
map <Leader>rs :call RunNearestSpec()<CR>
map <Leader>rl :call RunLastSpec()<CR>
map <Leader>ra :call RunAllSpecs()<CR>

"" Solarized theme
set background=dark
colorscheme solarized

