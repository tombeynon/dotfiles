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
Plug 'ntpeters/vim-better-whitespace'

" LanguageClient
Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': 'bash install.sh',
      \ }

" IDE
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

" Search
Plug 'junegunn/vim-slash'

" CTags
Plug 'ludovicchabant/vim-gutentags'

" File explorer
Plug 'Shougo/unite.vim'
Plug 'Shougo/neossh.vim'
Plug 'Shougo/vimfiler.vim'

" FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'

" Tagbar
Plug 'majutsushi/tagbar'

" Completion
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'

Plug 'w0rp/ale'
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'
Plug 'vim-scripts/marvim'

" Terminal/Tests
Plug 'kassio/neoterm'
Plug 'janko-m/vim-test'

" Unified navigation in tmux and vim
Plug 'christoomey/vim-tmux-navigator'

" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'lambdalisue/vim-gista'

" Languages
Plug 'sheerun/vim-polyglot'
Plug 'AndrewRadev/vim-eco'
Plug 'sjl/strftimedammit.vim'
Plug 'b4b4r07/vim-ansible-vault'

" Ruby, Rails and Bundler
Plug 'vim-ruby/vim-ruby'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
Plug 'p0deje/vim-ruby-interpolation'
Plug 'ecomba/vim-ruby-refactoring'
Plug 'killphi/vim-legend'

" Theme
Plug 'ajmwagar/vim-deus'

" Statusbar
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'edkolev/tmuxline.vim'

" Buffers, windows and tabs
Plug 'vim-scripts/bufkill.vim'
Plug 'dr-chip-vim-scripts/ZoomWin'
Plug 'schickling/vim-bufonly'
Plug 'gcmt/taboo.vim'
Plug 't9md/vim-choosewin'

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
let g:session_directory = "./.vim/"
let g:session_default_name = "session"
let g:session_autoload = "yes"
let g:session_autosave = "yes"


"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

"" Escape key delay
set nottimeout ttimeout ttimeoutlen=0

let mapleader=","

map § <Esc>
imap § <Esc>

nmap <silent> <leader>ev :e $MYVIMRC<cr>
nmap <silent> <leader>sv :so $MYVIMRC<cr>

map <silent> <C-e> :VimFilerExplorer -toggle -parent -force-hide<CR>
map <silent> <C-p> :Files<CR>
map <silent> <C-b> :FZFMru<CR>
map <silent> <C-t> :TagbarToggle<CR>

"" Helpers
nnoremap <Leader>w :w<CR>
nnoremap <Leader>e :VimFilerExplorer -find<CR>
nnoremap <Leader>t :TW<CR>
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

autocmd BufEnter * EnableStripWhitespaceOnSave

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

let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
      \ 'ruby': ['solargraph','stdio']
      \ }

"" Completion
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
" suppress the annoying 'match x of y' messages
set shortmess+=c
" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <c-c> <ESC>
let g:ncm2#complete_length = [[1,3],[7,2]]

" Disable NCM2 on multiple cursors
function! g:Multiple_cursors_before()
  call ncm2#disable_for_buffer()
endfunction
function! g:Multiple_cursors_after()
  call ncm2#enable_for_buffer()
endfunction

"" Neoformat
let g:neoformat_enabled_eruby = ['html-beutify']

"" Find and replace
set inccommand=nosplit " split for split preview

"" Visual expand region with v
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

"" Insert helpers
inoremap <M-o>       <Esc>o
let g:ragtag_global_maps = 1

"" NERDTree
let NERDTreeQuitOnOpen = 1

"" Tags
let g:gutentags_cache_dir = '.vim'

"" TagBar
let g:tagbar_autoclose = 1
let g:tagbar_map_nexttag = ']t'
let g:tagbar_map_prevtag = '[t'

"" Legend
let g:legend_file_path = ".vim/coverage.vim"
let g:legend_miss_sign    = "⊙"

nmap - <Plug>(choosewin)

" FZF
let g:fzf_layout = { 'down': '~20%' }
let g:fzf_history_dir = './.vim/fzf-history'
let g:fzf_mru_relative = 1

command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>,
      \                 <bang>0 ? fzf#vim#with_preview('up:60%')
      \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
      \                 <bang>0)

" Neoterm
" let g:neoterm_size = 15
" let g:neoterm_fixedsize = 1
let g:neoterm_default_mod = 'botright'
let g:neoterm_autoscroll = 1

"" Show/hide terminal
nnoremap <silent> <leader>to :execute 'Topen'<cr>
nnoremap <silent> <leader>th :execute 'Tclose'<cr>

" Tests
let test#strategy = "neoterm"
nmap <silent> <leader>rt :call RunTest('TestNearest')<CR>
nmap <silent> <leader>rs :call RunTest('TestFile')<CR>
nmap <silent> <leader>ra :call RunTest('TestSuite')<CR>
nmap <silent> <leader>rl :call RunTest('TestLast')<CR>
nmap <silent> <leader>rv :call RunTest('TestVisit')<CR>

function! RunTest(cmd)
  execute ':Topen'
  " call neoterm#normal('G') " Scroll to the end of the neoterm window
  exec a:cmd
endfunction

" Gitup
function! OpenGitup()
  execute ':silent exec "!gitup"'
endfunction
command! Gitup :call OpenGitup()

"" Statusline
set laststatus=2
let g:tmuxline_theme = 'lightline'

let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ],
      \   'right': [ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ], [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'inactive': {
      \   'left': [ ['filename'] ],
      \   'right': [ ['filetype'] ],
      \ },
      \ 'component_function': {
      \   'modified': 'LightlineModified',
      \   'readonly': 'LightlineReadonly',
      \   'fugitive': 'LightlineFugitive',
      \   'filename': 'LightlineFilename',
      \   'fileformat': 'LightlineFileformat',
      \   'filetype': 'LightlineFiletype',
      \   'fileencoding': 'LightlineFileencoding',
      \   'mode': 'LightlineMode',
      \ },
      \ 'component_expand': {
      \   'linter_checking': 'lightline#ale#checking',
      \   'linter_warnings': 'lightline#ale#warnings',
      \   'linter_errors': 'lightline#ale#errors',
      \   'linter_ok': 'lightline#ale#ok',
      \ },
      \ 'component_type': {
      \   'linter_checking': 'left',
      \   'linter_warnings': 'warning',
      \   'linter_errors': 'error',
      \   'linter_ok': 'left',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_warnings = "\uf071"
let g:lightline#ale#indicator_errors = "\uf05e"
let g:lightline#ale#indicator_ok = "\uf00c"

function! LightlineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '' : ''
endfunction

function! LightlineFilename()
  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:f') ? expand('%:f') : '[No Name]') .
        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFugitive()
  if winwidth(0) > 70 && &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
    let branch = fugitive#head()
    return branch !=# '' ? ' '.branch : ''
  endif
  return ''
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

"" ALE linting
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_fixers = {
\  'ruby': ['rubocop'],
\}
nmap <leader>f <Plug>(ale_fix)

augroup ALELightlineUpdate
    autocmd!
    autocmd User ALELint call lightline#update()
augroup END

"" Ansible vault
let g:ansible_vault_password_file = '.lollipop'

"" highlight current window
augroup BgHighlight
  autocmd!
  autocmd WinEnter * set cul colorcolumn=80
  autocmd WinLeave * set nocul colorcolumn=0
augroup END

"" reload changed file
" autocmd FocusGained * silent! checktime
autocmd WinEnter,BufWinEnter,FocusGained * checktime

" Hide status bar while using fzf commands
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

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

set mouse=a

"" Solarized theme
set background=dark
" set termguicolors
colorscheme deus
