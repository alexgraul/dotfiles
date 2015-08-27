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

" colorscheme desert
" colorscheme ir_black
" colorscheme railscasts
" colorscheme ir_black
" colorscheme railscasts
" colorscheme mac_classic
" colorscheme topfunky-light

set background=dark
colorscheme solarized
set transparency=10

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

"Rooter for change on tabs
autocmd BufEnter *.rb,*.html,*.py,*.json,*.css,*.json,*.js,Rakefile,*.ru :Rooter
autocmd TabEnter *.rb,*.html,*.py,*.json,*.css,*.json,*.js,Rakefile,*.ru :Rooter


set guitablabel=%F



set splitbelow
set splitright

augroup filetypedetect 
  au BufNewFile,BufRead Thorfile set filetype=ruby syntax=ruby
  au BufNewFile,BufRead *.thor set filetype=ruby syntax=ruby
  au BufNewFile,BufRead *.pig set filetype=pig syntax=pig 
augroup END 

au FileType python setl sw=2 sts=2 et

" Quickly open the vim config file in a new tab.
let mapleader = ","
nmap <leader>v :tabedit $MYVIMRC<CR>

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

nmap <LEADER>d :NERDTreeToggle<CR>
let NERDSpaceDelims=1
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.pyc$','\.DS_Store$']

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

" :command Formatjson %!python -m json.tool

" Markdown
if has("autocmd")
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
