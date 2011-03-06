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
set ruler                   " display the ruler at the bottom of the window
set wildmenu                " nice tab completion just above the status bar

set history=1000            " remember more than 20 commands/search patterns
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

" colorscheme desert
colorscheme ir_black
" colorscheme railscasts
" colorscheme topfunky-light
" colorscheme vibrantink
" colorscheme vividchalk

" Switch windows with Ctrl + a movement key
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

""" Make it easy to modify vim settings on the fly.
""
" From http://vimcasts.org/episodes/updating-your-vimrc-file-on-the-fly/

" Automatically source the config file on save.
if has("autocmd")
  autocmd BufWritePost .vimrc source $MYVIMRC
endif

" Quickly open the vim config file in a new tab.
let mapleader = ","
nmap <leader>v :tabedit $MYVIMRC<CR>

" Show whitespace
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>s :set nolist!<CR>
set nolist!

nmap <LEADER>d :NERDTreeToggle<CR>


" Useful for running vi within irb
" From http://vimcasts.org/episodes/running-vim-within-irb/
if has("autocmd")
  filetype plugin indent on  " enable filetype detection

  " Restore cursor position
  "autocmd BufReadPost *
  "  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  "  \   exe "normal! g`\"" |
  "  \ endif
endif
if &t_Co > 2 || has("gui_running")
  syntax on
endif

