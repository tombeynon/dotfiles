set nocompatible                " choose no compatibility with legacy vi
filetype off                  " required
 
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Dispatch
Plugin 'tpope/vim-dispatch'

" Helpers and bindings
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-unimpaired.git'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-eunuch.git'
Plugin 'terryma/vim-expand-region'

" Code helpers
Plugin 'tpope/vim-commentary'
Plugin 'godlygeek/tabular'
Plugin 'edsono/vim-matchit'
Plugin 'gregsexton/MatchTag'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-endwise'
Plugin 'AndrewRadev/splitjoin.vim'

" Search
Plugin 'rking/ag.vim'
Plugin 'bronson/vim-visual-star-search'

" Gitignore
Plugin 'vim-scripts/gitignore'

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

" Languages
Plugin 'pangloss/vim-javascript'

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

"" Escape key delay
set esckeys                     " no escape key delay
set timeoutlen=1000 ttimeoutlen=0

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

"" Move cursor to the end of paste
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

"" Stupid window
map q: :q

"" Visual star search
" use ag for recursive searching so we don't find 10,000 useless hits inside node_modules
nnoremap <leader>* :call ag#Ag('grep', '--literal ' . shellescape(expand("<cword>")))<CR>
vnoremap <leader>* :<C-u>call VisualStarSearchSet('/', 'raw')<CR>:call ag#Ag('grep', '--literal ' . shellescape(@/))<CR>

"" Visual expand region with v
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

"" Insert helpers
inoremap <M-o>       <Esc>o
inoremap <C-j>       <Down>
let g:ragtag_global_maps = 1

"" Airline
set laststatus=2
let g:tmuxline_powerline_separators = 0 " disable powerline seperators

"" NERDTree
let NERDTreeQuitOnOpen = 1

"" Ctrl-P
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Use Ag
let g:ctrlp_use_caching = 0
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor

    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
    \ }
endif

" RSpec.vim mappings
let g:rspec_runner = "os_x_iterm"
let g:rspec_command = 'Dispatch rspec {spec}'

map <Leader>rt :call RunCurrentSpecFile()<CR>
map <Leader>rs :call RunNearestSpec()<CR>
map <Leader>rl :call RunLastSpec()<CR>
map <Leader>ra :call RunAllSpecs()<CR>

"" vp doesn't replace paste buffer
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()

"" Solarized theme
set background=dark
colorscheme solarized

