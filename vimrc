set nocompatible

language en_US.UTF-8

"MinPack
packadd minpac

call minpac#init({'verbose': 3})

call minpac#add('altercation/vim-colors-solarized') "colors
call minpac#add('tpope/vim-markdown') "markdown support
call minpac#add('airblade/vim-rooter') "auto-sets root working dir
call minpac#add('preservim/nerdtree') "NERDTree
call minpac#add('mileszs/ack.vim') "Inline Ack support
call minpac#add('pangloss/vim-javascript') "Better JS Support
call minpac#add('preservim/nerdcommenter') "NERDTree
call minpac#add('easymotion/vim-easymotion') "Easier move commands
call minpac#add('ap/vim-css-color') "Show css colours inline
call minpac#add('ctrlpvim/ctrlp.vim') "Fuzzy search
call minpac#add('burner/vim-svelte') "Fuzzy search
call minpac#add('vim-airline/vim-airline') "Lint engine
call minpac#add('dense-analysis/ale') "Lint engine

command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()
command! PackStatus call minpac#status()

"ALE Config
let g:airline#extensions#ale#enabled = 1

let g:ale_linters_explicit = 1
let g:ale_sign_column_always = 1
let g:ale_linter_aliases = {'svelte': ['css', 'javascript']}
let g:ale_linters = {'json': ['jsonlint'], 'javascript': ['prettier', 'eslint'], 'svelte': ['stylelint', 'eslint'] }

set tabstop=2               " default size of a real tab stop
set softtabstop=2           " pressing tab/backspaces inserts/removes 2 chars
set shiftwidth=2            " the number of spaces used by << and >>
set expandtab               " insert spaces instead of tabs

set autoindent
set nowrap                  " disable line wrapping
set incsearch               " show search matches as you type

set hidden                  " open multiple files in one 'window'
set number                  " show line numbers
set laststatus=2            " always show status bar
"set relativenumber          " relative line numbers
set ruler                   " display the ruler at the bottom of the window
set wildmenu                " nice tab completion just above the status bar

set foldmethod=indent       " enable folding on indents
set foldlevelstart=20       " stop folding on open

set history=10000           " remember more than 20 commands/search patterns
set noswapfile
set backupdir=~/.tmp

set clipboard=unnamed       " use OSX clipboard by default

" Bash style autocomplete with tab-menu for options
set wildmode=longest,list,full
set wildmenu

" disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" open and close folds with space
nnoremap <space> za
vnoremap <space> zf

set background=dark
colorscheme solarized
set transparency=0

" Switch windows with Ctrl + a movement key
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

""" Make it easy to modify vim settings on the fly.
" From http://vimcasts.org/episodes/updating-your-vimrc-file-on-the-fly/

"remove netrw prompt on saving a file
set cmdheight=3

" Automatically source the config file on save.
if has("autocmd")
  autocmd BufWritePost .vimrc source $MYVIMRC
endif

" Quickly open the vim config file in a new tab.
let mapleader = ","
nmap <leader>v :tabedit $MYVIMRC<CR>

"Rooter for change on tabs
if has("autocmd")
  autocmd BufEnter *.py,*.ts,*.rb,*.html,*.py,*.json,*.css,*.json,*.js,*.ru,*.svelte :Rooter
  autocmd TabEnter *.py,*.ts,*.rb,*.html,*.py,*.json,*.css,*.json,*.js,*.ru,*.svelte :Rooter
endif

set guitablabel=%F
set splitbelow
set splitright

au FileType python setl sw=2 sts=2 et

" CTRLP
nmap <leader>p :CtrlP<CR>
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v(\.git|\.hg|\.svn|\.sass-cache|deploy|node_modules|labs_cookbook|build|tmp|log|vendor\/(rails|gems|plugins))$',
  \ 'file': '\v(\.#.+|\.DS_Store|\.svn|\.sass-cache|\.png|\.jpe?g|\.gif|\.elc|\.rbc|\.pyc|\.swp|\.psd|\.pid|\.log|\.ai|\.pdf|\.mov|\.aep|\.dmg|\.zip|\.gz)$',
  \ }
nmap <leader>x :CtrlPClearCache<CR>

" Show whitespace
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>s :set nolist!<CR>
set nolist!

" NERDTree Config
nmap <LEADER>d :NERDTreeToggle<CR>
let NERDSpaceDelims=1
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.swp$','\.pyc$','\.DS_Store$']

if has("autocmd")
  filetype plugin indent on  " enable filetype detection
endif

if has("autocmd")
" Indentation
  autocmd FileType sh setlocal shiftwidth=4
  autocmd FileType css setlocal shiftwidth=2
  autocmd FileType python setlocal shiftwidth=4
  autocmd BufRead,BufNewFile *.json setfiletype json
  au BufEnter *.css set nocindent
  au BufLeave *.css set cindent

  " Markdown
  autocmd FileType markdown set linebreak
  autocmd BufRead Readme.md set wrap
endif

"Cmd-Opt-L/R between MacVim Tabs
if has("gui_macvim")
  noremap <M-D-Right> :tabnext<CR>
  noremap <M-D-Left> :tabprev<CR>
endif
