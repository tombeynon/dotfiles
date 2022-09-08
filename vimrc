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

" IDE
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

" Search
" Plug 'junegunn/vim-slash'

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
Plug 'yuki-ycino/fzf-preview.vim'

" Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'w0rp/ale'
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'
Plug 'vim-scripts/marvim'

" Terminal/Tests
Plug 'kassio/neoterm'
Plug 'janko-m/vim-test'

" Tmux integration
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
Plug 'joshdick/onedark.vim'

" Statusbar
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'edkolev/tmuxline.vim'

" Buffers, windows and tabs
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
Plug 'neomake/neomake'

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
" let g:session_default_name = "session"
" let g:session_autoload = "yes"
" let g:session_autosave = "yes"
let g:session_lock_enabled = 0


"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
nnoremap <esc> :noh<return><esc>

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
map <silent> <C-t> :BTags<CR>

"" Helpers
if has('nvim')
  tmap <C-o> <C-\><C-n>
endif

nnoremap <Leader>w :w<CR>
nnoremap <Leader>e :VimFilerExplorer -find<CR>
nnoremap <Leader>tc :tabclose<CR>
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0
let g:strip_whitelines_at_eof=1

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

"" Completion
" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Multiple cursors
" xmap <silent> <C-x> y/\V<C-r>=escape(@",'/\')<CR><CR>gN<Plug>(coc-cursors-range)gn
" nmap <expr> <silent> <C-x> <SID>select_current_word()

function! s:select_current_word()
  return "\<Plug>(coc-cursors-word)*:nohlsearch\<CR>"
endfunc

function! s:select_current_range()
  return "y/\V<C-r>=escape(@\",'/\')<CR><CR>gN<Plug>(coc-cursors-range)gn"
endfunc

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
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
let g:neoterm_default_mod = 'vertical botright'
let g:neoterm_autoscroll = 1

"" Show/hide terminal
nnoremap <silent> <leader>to :execute 'Topen'<cr>
nnoremap <silent> <leader>th :execute 'Tclose'<cr>

" Tests
let test#strategy = "neomake"
" let g:neomake_open_list = 2

nmap <silent> <leader>ro :execute 'copen'<cr>
nmap <silent> <leader>rh :execute 'cclose'<cr>
nmap <silent> <leader>rc :call CloseAndClearQF()<cr>

function! CloseAndClearQF()
  call setqflist([])
  execute ':cclose'
endfunction

nmap <silent> <leader>rt :execute 'TestNearest'<CR>
nmap <silent> <leader>rs :execute 'TestFile'<CR>
nmap <silent> <leader>ra :execute 'TestSuite'<CR>
nmap <silent> <leader>rl :execute 'TestLast'<CR>
nmap <silent> <leader>rv :execute 'TestVisit'<CR>

nmap <silent> <leader>tt :execute RunTest('TestNearest -strategy=neoterm')<CR>
nmap <silent> <leader>ts :execute RunTest('TestFile -strategy=neoterm')<CR>
nmap <silent> <leader>ta :execute RunTest('TestSuite -strategy=neoterm')<CR>
nmap <silent> <leader>tl :execute RunTest('TestLast -strategy=neoterm')<CR>

function! RunTest(cmd)
  execute ':Topen'
  " call neoterm#normal('G') " Scroll to the end of the neoterm window
  execute a:cmd
endfunction

" Docker config if required
if filereadable(expand("docker-compose.yml"))
  let g:docker = 1
else
  let g:docker = 0
endif

function! DockerTransform(cmd) abort
  return 'docker-compose run app '.a:cmd
endfunction

let g:test#custom_transformations = {'docker': function('DockerTransform')}

if g:docker
  let g:test#transformation = 'docker'
  " let g:ale_command_wrapper = 'docker-compose run app'
end

" Gitup
function! OpenGitup()
  execute ':silent exec "!gitup"'
endfunction
command! Gitup :call OpenGitup()

"" Statusline
set laststatus=2
let g:tmuxline_theme = 'lightline'

let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ],
      \   'right': [ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],
      \              [ 'make_checking', 'make_errors', 'make_warnings', 'make_ok' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
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
      \   'make_checking': 'NeomakeChecking',
      \   'make_warnings': 'NeomakeWarnings',
      \   'make_errors': 'NeomakeErrors',
      \   'make_ok': 'NeomakeOk',
      \ },
      \ 'component_type': {
      \   'linter_checking': 'left',
      \   'linter_warnings': 'warning',
      \   'linter_errors': 'error',
      \   'linter_ok': 'left',
      \   'make_checking': 'warning',
      \   'make_warnings': 'warning',
      \   'make_errors': 'error',
      \   'make_ok': 'left',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_warnings = "\uf071"
let g:lightline#ale#indicator_errors = "\uf05e"
let g:lightline#ale#indicator_ok = "\uf00c"

function! s:get_neomake_counts()
  let l:counts = neomake#statusline#LoclistCounts()

  if empty(l:counts)
    return neomake#statusline#QflistCounts()
  else
    return l:counts
  endif
endfunction

function! NeomakeWarnings()
  let counts = s:get_neomake_counts()
  let warnings = get(counts, 'W', 0)
  return warnings ? "⚠".warnings : ''
endfunction

function! NeomakeErrors()
  let counts = s:get_neomake_counts()
  let errors = get(counts, 'E', 0)
  return errors ? "✖".errors : ''
endfunction

function! NeomakeChecking()
  let running = neomake#GetJobs()
  return empty(running) ? '' : ""
endfunction

function! NeomakeOk()
  let checking = NeomakeChecking()
  let warnings = NeomakeWarnings()
  let errors = NeomakeErrors()
  return errors == '' && warnings == '' && checking == '' ? '' : ''
endfunction

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

augroup ALELightlineUpdate
    autocmd!
    autocmd User ALELint call lightline#update()
augroup END

augroup NeomakeLightlineUpdate
    autocmd!
    autocmd User NeomakeJobStarted,NeomakeFinished nested call lightline#update()
augroup END

"" ALE linting
let g:ale_linters = {'javascript': ['eslint']}

let g:ale_fixers = {
\  'ruby': ['rubocop'],
\}
nmap <leader>f <Plug>(ale_fix)

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
 autocmd WinEnter,BufWinEnter,FocusGained * silent! checktime

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
colorscheme onedark
