set nocompatible

silent! call pathogen#runtime_append_all_bundles()

set tabstop=2               " default size of a real tab stop
set softtabstop=2           " pressing tab/backspaces inserts/removes 2 chars
set shiftwidth=2            " the number of spaces used by << and >>
set expandtab               " insert spaces instead of tabs
"set textwidth=72            " right margin to use when wrapping text

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

set clipboard=unnamed       " use OSX clipboard by default

set lines=45
set columns=100

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

" colorscheme desert
" colorscheme ir_black
" colorscheme railscasts
" colorscheme ir_black
" colorscheme railscasts
" colorscheme mac_classic
" colorscheme topfunky-light

set background=dark
colorscheme solarized

" Switch windows with Ctrl + a movement key
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

""" Make it easy to modify vim settings on the fly.
" From http://vimcasts.org/episodes/updating-your-vimrc-file-on-the-fly/

" Automatically source the config file on save.
if has("autocmd")
  autocmd BufWritePost .vimrc source $MYVIMRC
endif

"Rooter for change on tabs
autocmd BufEnter *.rb,*.html,*.py,*.json,*.css,*.json,*.js,Rakefile,*.ru :Rooter
autocmd TabEnter *.rb,*.html,*.py,*.json,*.css,*.json,*.js,Rakefile,*.ru :Rooter

" Quickly open the vim config file in a new tab.
let mapleader = ","
nmap <leader>v :tabedit $MYVIMRC<CR>

" Show whitespace
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>s :set nolist!<CR>
set nolist!

nmap <LEADER>d :NERDTreeToggle<CR>
let NERDSpaceDelims=1

if has("autocmd")
  filetype plugin indent on  " enable filetype detection
endif

" Indentation
if has("autocmd")
  autocmd FileType sh setlocal shiftwidth=4
  autocmd FileType css setlocal shiftwidth=2
  autocmd FileType python setlocal shiftwidth=4
  autocmd BufRead,BufNewFile *.json setfiletype json
  au BufEnter *.css set nocindent
  au BufLeave *.css set cindent
endif

" Markdown
if has("autocmd")
  autocmd FileType markdown set wrap
  autocmd FileType markdown set linebreak
endif

" Functions
function! OpenChangedFiles()
  only " Close all windows, unless they're modified
  let status = system('git status -s | grep "^ \?\(M\|A\)" | cut -d " " -f 3')
  let filenames = split(status, "\n")
  exec "edit " . filenames[0]
  for filename in filenames[1:]
    exec "sp " . filename
  endfor
endfunction
command! OpenChangedFiles :call OpenChangedFiles()
