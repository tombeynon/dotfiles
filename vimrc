set nocompatible                " choose no compatibility with legacy vi

" Install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))                                                                                    
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim                                                             
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif 

call plug#begin()

" Dispatch
Plug 'tpope/vim-dispatch'

" Helpers and bindings
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-eunuch'
Plug 'terryma/vim-expand-region'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'
Plug 'Lokaltog/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'

" Code helpers
Plug 'tpope/vim-commentary'
Plug 'godlygeek/tabular'
Plug 'edsono/vim-matchit'
Plug 'gregsexton/MatchTag'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-endwise'
Plug 'AndrewRadev/splitjoin.vim'

" IDE
Plug 'xolox/vim-session'

" Search
Plug 'rking/ag.vim'
Plug 'bronson/vim-visual-star-search'

" Gitignore
Plug 'vim-scripts/gitignore'

" CTags
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'

" NERDTree
Plug 'scrooloose/nerdtree'

" Ctrl-P
Plug 'ctrlpvim/ctrlp.vim'

" Tagbar
Plug 'majutsushi/tagbar'

" Completion
Plug 'Shougo/deoplete.nvim'
Plug 'benekastah/neomake'

" Terminal/Tests
Plug 'kassio/neoterm'

" Unified navigation in tmux and vim
Plug 'christoomey/vim-tmux-navigator'

" Git
Plug 'tpope/vim-fugitive'

" Languages
Plug 'sheerun/vim-polyglot'
Plug 'sjl/strftimedammit.vim'

" Ruby, Rails and Bundler
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
Plug 'thoughtbot/vim-rspec'

" Solarized theme
Plug 'altercation/vim-colors-solarized'

" Airline statusbar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'

" Buffers, windows and tabs
Plug 'vim-scripts/bufkill.vim'
Plug 'dr-chip-vim-scripts/ZoomWin'
Plug 'schickling/vim-bufonly'
Plug 'wesQ3/vim-windowswap'
Plug 'gcmt/taboo.vim'

" Dash
Plug 'rizzatti/dash.vim'

" Markdown
Plug 'itspriddle/vim-marked'

" Time tracking
Plug 'wakatime/vim-wakatime'

" Icons
Plug 'ryanoasis/vim-devicons'

call plug#end()

if !has('nvim')
  set encoding=utf-8
endif

set showcmd                     " display incomplete commands
set hidden
set lazyredraw                  " Don't update the display while executing macros
set noshowmode                  " Airline shows the mode
set wildmenu                    " Enable enhanced command-line completion
set number                      " always show line numbers
set noswapfile                  " Git handles version controlling
set autoread                    " Auto-reload changed files

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces 
set expandtab                   " use spaces, not tabs
set backspace=indent,eol,start  " backspace through everything in insert mode
set cursorline                  " highlight current line
set colorcolumn=80              " highlight end of line 
set scrolloff=8                 " keep 8 lines around cursor 
set sidescroll=1
set sidescrolloff=15

"" Sessions
set undofile                    " maintain undo history between sessions
set undodir=~/.vim/undodir
set sessionoptions+=tabpages,globals " taboo
set sessionoptions-=blank
let g:session_autoload = 'no'

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

"" Escape key delay
set esckeys                     " no escape key delay
set nottimeout ttimeout ttimeoutlen=0

let mapleader=","

map § <Esc>
imap § <Esc>

nmap <silent> <leader>ev :e $MYVIMRC<cr>
nmap <silent> <leader>sv :so $MYVIMRC<cr>

map <silent> <C-e> :NERDTreeToggle<CR>
map <silent> <C-b> :CtrlPMRU<CR>
map <silent> <C-t> :TagbarToggle<CR>

"" Helpers
nnoremap <Leader>w :w<CR>
nnoremap <Leader>e :NERDTreeFind<CR>

"" System clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

"" Deoplete
let g:deoplete#enable_at_startup = 1

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ deoplete#mappings#manual_complete()

inoremap <expr><S-Tab>  pumvisible() ? "\<C-p>" : "\<C-h>"

"" Neomake
autocmd! BufWritePost * Neomake
let g:neomake_ruby_enabled_makers = ['mri'] " disable rubocop

"" Visual star search
" Use Ag for search
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
let g:airline_powerline_fonts = 1 " https://github.com/powerline/fonts
let g:tmuxline_powerline_separators = 1
let g:tmuxline_preset = 'powerline'

"" NERDTree
let NERDTreeQuitOnOpen = 1

"" Tags
set cpoptions+=d
set tags=./tags
let g:easytags_dynamic_files = 2
let g:easytags_async = 1
let g:easytags_auto_highlight = 0

"" TagBar
let g:tagbar_autoclose = 1
let g:tagbar_map_nexttag = ']t'
let g:tagbar_map_prevtag = '[t'

"" Ctrl P
let g:ctrlp_switch_buffer = 'et'

"" Use Ag
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

" Window swap
let g:windowswap_map_keys = 0 "prevent default bindings
nnoremap <silent> <leader>yw :call WindowSwap#MarkWindowSwap()<CR>
nnoremap <silent> <leader>pw :call WindowSwap#DoWindowSwap()<CR>
nnoremap <silent> <leader>sw :call WindowSwap#EasyWindowSwap()<CR>

" Dash
nmap <silent> <leader>d <Plug>DashSearch

" Neoterm
let g:neoterm_size = 15
let g:neoterm_run_tests_bg = 1
let g:neoterm_close_when_tests_succeed = 1
let g:neoterm_raise_when_tests_fail = 1

"" Show/hide terminal
nnoremap <silent> ,to :call neoterm#open()<cr>
nnoremap <silent> ,th :call neoterm#close()<cr>

tnoremap <Esc> <C-\><C-n> " exit terminal mode with esc

" Tests
map <Leader>rt :call neoterm#test#run('current')<CR>
map <Leader>rs :call neoterm#test#run('file')<CR>
map <Leader>ra :call neoterm#test#run('all')<CR>

"" highlight current window
augroup BgHighlight
  autocmd!
  autocmd WinEnter * set cul colorcolumn=80
  autocmd WinLeave * set nocul colorcolumn=0
augroup END

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

