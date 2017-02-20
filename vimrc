set nocompatible                " choose no compatibility with legacy vi

" Install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))                                                                                    
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim                                                             
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif 

call plug#begin()

" Helpers and bindings
if !has('nvim')
  Plug 'tpope/vim-sensible'
endif
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-eunuch'
Plug 'terryma/vim-expand-region'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'
Plug 'Lokaltog/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'
Plug 'wellle/targets.vim'

" Code helpers
Plug 'tpope/vim-commentary'
Plug 'junegunn/vim-easy-align'
Plug 'tmhedberg/matchit'
Plug 'gregsexton/MatchTag'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-endwise'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'sbdchd/neoformat'

" IDE
Plug 'xolox/vim-session'

" Search
Plug 'junegunn/vim-slash'

" Gitignore
Plug 'vim-scripts/gitignore'

" CTags
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'

" File explorer
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim'

" FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Tagbar
Plug 'majutsushi/tagbar'

" Completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'benekastah/neomake'
Plug 'fishbullet/deoplete-ruby'

" Terminal/Tests
Plug 'kassio/neoterm'
Plug 'janko-m/vim-test'

" Unified navigation in tmux and vim
Plug 'christoomey/vim-tmux-navigator'

" Git
Plug 'tpope/vim-fugitive'
Plug 'lambdalisue/vim-gista'

" Languages
Plug 'sheerun/vim-polyglot'
Plug 'AndrewRadev/vim-eco'
Plug 'sjl/strftimedammit.vim'

" Ruby, Rails and Bundler
Plug 'vim-ruby/vim-ruby'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
Plug 'p0deje/vim-ruby-interpolation'
Plug 'ecomba/vim-ruby-refactoring'
Plug 'killphi/vim-legend'

" Theme
Plug 'morhetz/gruvbox'

" Airline statusbar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'

" Buffers, windows and tabs
Plug 'vim-scripts/bufkill.vim'
Plug 'dr-chip-vim-scripts/ZoomWin'
Plug 'schickling/vim-bufonly'
Plug 'gcmt/taboo.vim'
Plug 't9md/vim-choosewin'

" Dash
Plug 'rizzatti/dash.vim'

" Markdown
Plug 'itspriddle/vim-marked'

" Time tracking
Plug 'wakatime/vim-wakatime'

" Icons
Plug 'ryanoasis/vim-devicons'

" Dispatch
Plug 'tpope/vim-dispatch'
Plug 'radenling/vim-dispatch-neovim'


call plug#end()

if !has('nvim')
  set encoding=utf-8
endif

set showcmd                     " display incomplete commands
set hidden
set lazyredraw                  " Don't update the display while executing macros
set noshowmode                  " Airline shows the mode
set wildmenu                    " Enable enhanced command-line completion
set relativenumber              " relative line numbers
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

map <silent> <C-e> :VimFilerExplorer -toggle -parent -force-hide<CR>
map <silent> <C-p> :Files<CR>
map <silent> <C-b> :History<CR>
map <silent> <C-t> :TagbarToggle<CR>

"" Helpers
nnoremap <Leader>w :w<CR>
nnoremap <Leader>e :VimFilerExplorer -find<CR>
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

"" File explorer
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
	
call vimfiler#custom#profile('default', 'context', {
\   'safe' : 0,
\ })
autocmd FileType vimfiler nnoremap <silent><buffer><expr> s vimfiler#do_switch_action('split')
autocmd FileType vimfiler nnoremap <silent><buffer><expr> v vimfiler#do_switch_action('vsplit')
autocmd FileType vimfiler nmap <silent><buffer> <C-l> <Plug>(vimfiler_switch_to_other_window)
autocmd FileType vimfiler nmap <silent><buffer> p <Plug>(vimfiler_preview_file)
autocmd FileType vimfiler nmap <silent><buffer> <Leader>r <Plug>(vimfiler_redraw_screen)

"" System clipboard
vmap <Leader>y "+y
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" CWD name
let cwname = fnamemodify(getcwd(), ':p:h:t')

"" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 50

inoremap <silent><expr><Tab> pumvisible() ? "\<c-n>"
      \ : (<SID>is_whitespace() ? "\<Tab>" : deoplete#mappings#manual_complete())
inoremap <expr><S-Tab>  pumvisible() ? "\<c-p>" : "\<c-h>"
function! s:is_whitespace()
  let l:col = col('.') - 1
  return !l:col || getline('.')[l:col - 1]  =~? '\s'
endfunction

"" Neomake
autocmd! BufWritePost * Neomake
let g:neomake_ruby_enabled_makers = ['mri'] " disable rubocop

"" Neoformat
let g:neoformat_enabled_eruby = ['html-beutify']

"" Find and replace
nmap <Leader>si <Plug>(FNR)
nmap <Leader>ss <Plug>(FNR%)
xmap <Leader>si <Plug>(FNR)
xmap <Leader>ss <Plug>(FNR%)

"" Visual expand region with v
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

"" Insert helpers
inoremap <M-o>       <Esc>o
inoremap <C-j>       <Down>
let g:ragtag_global_maps = 1

"" NERDTree
let NERDTreeQuitOnOpen = 1

"" Tags
set cpoptions+=d
set tags=./.vim/tags
let g:easytags_file = './.vim/tags'
let g:easytags_async = 1
let g:easytags_auto_highlight = 0

"" TagBar
let g:tagbar_autoclose = 1
let g:tagbar_map_nexttag = ']t'
let g:tagbar_map_prevtag = '[t'

"" Legend
let g:legend_file_path = ".vim/coverage.vim"
let g:legend_miss_sign    = "⊙"

nmap - <Plug>(choosewin)

" Dash
nmap <silent> <leader>d <Plug>DashSearch

" FZF
let g:fzf_nvim_statusline = 0
let g:fzf_layout = { 'down': '~20%' }
let g:fzf_history_dir = './.vim/fzf-history'

" Neoterm
let g:neoterm_size = 15

"" Show/hide terminal
nnoremap <silent> <leader>to :call neoterm#open()<cr>
nnoremap <silent> <leader>th :call neoterm#close()<cr>

" Tests
let test#strategy = "neoterm"
nmap <silent> <leader>rt :TestNearest<CR>
nmap <silent> <leader>rs :TestFile<CR>
nmap <silent> <leader>ra :TestSuite<CR>
nmap <silent> <leader>rl :TestLast<CR>
nmap <silent> <leader>rv :TestVisit<CR>

" Gitup
function! OpenGitup()
  execute ':T gitup'
  execute 'call neoterm#close()'
endfunction
command! Gitup :call OpenGitup()

"" Airline
set laststatus=2
let g:airline#extensions#tagbar#enabled = 0
let g:airline_powerline_fonts = 1 " https://github.com/powerline/fonts
let g:tmuxline_powerline_separators = 1
let g:tmuxline_preset = 'powerline'
let g:airline_section_z = '%{cwname}'

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
vnoremap <silent> <expr> p <sid>Repl()

"" Solarized theme
set background=dark
" set termguicolors
colorscheme gruvbox
