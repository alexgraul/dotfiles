" Graphical Vim config file
"
set encoding=utf-8
set guioptions-=T           " hide the toolbar
set guioptions-=r           " hide the scrollbars
set guioptions-=R           " hide the scrollbars with vertical split
set guioptions-=l           " hide the scrollbars
set guioptions-=L           " hide the scrollbars with vertical split
set guifont=Inconsolata:h15
set lines=40 columns=85     " window dimensions
set guitablabel=%t 
set guitabtooltip=%F

nmap <leader>1 :set lines=40 columns=85<CR><C-w>o
nmap <leader>2 :set lines=80 columns=204<CR><C-w>v
