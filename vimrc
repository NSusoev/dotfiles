" Plugins list:
" python-mode 
" vim-powerline

if has('gui_running') " global settings of GUI Vim
    set guioptions-=m " remove the menu
    set guioptions-=e " remove GUI tabs
    set guioptions-=T " remove toolbar
    set guioptions-=r " remove right scrollbar
    set guioptions-=L " remove left scrollbar
    set guioptions-=R
    set guioptions-=l
endif 

" Setup Pathogen 
filetype off
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on
set nocompatible
set modelines=0

" Show whitespace
" autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
" au InsertLeave * match ExtraWhitespace /\s\+$/

" Color scheme
syntax enable
set background=light
colorscheme solarized
set t_Co=256
set guifont=Monaco\ 12

" Setting for vim-powerline
set laststatus=2

" Better copy & paste
set pastetoggle=<F2>
set clipboard=unnamed

" sable backup and swap files 
set nobackup
set nowritebackup
set noswapfile

" Showing line numbers and length
set number  " show line numbers
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing

" indents
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" rebind <leader> key
let mapleader = ","

" Quick quit command
noremap <Leader>e :quit<CR>  " Quit current window
noremap <Leader>E :qa!<CR>   " Quit all windows

" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" map sort function to a key
noremap <Leader>s :sort<CR>

" search
set hlsearch
set incsearch
set ignorecase
set smartcase
set ic

" Removes highlight of your last search
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

" easier moving of code blocks in visual mode
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentat

" Python folding
set nofoldenable

" bind Ctrl+<movement> keys to move around the windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
