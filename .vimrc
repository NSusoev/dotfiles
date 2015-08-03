" NeoBundle Init
filetype off

" auto installing NeoNeoBundle
let isNpmInstalled = executable("npm")
let iCanHazNeoBundle=1
let neobundle_readme=expand($HOME.'/.vim/bundle/neobundle.vim/README.md')
if !filereadable(neobundle_readme)
    if !isNpmInstalled
        echo "==============================================="
        echo "Your need to install npm to enable all features"
        echo "==============================================="
    endif
        echo "Installing NeoBundle.."
        silent !mkdir -p $HOME/.vim/bundle
        silent !git clone https://github.com/Shougo/neobundle.vim $HOME/.vim/bundle/neobundle.vim
        let iCanHazNeoBundle=0
endif

" call bundle
if has('vim_starting')
    set runtimepath+=$HOME/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand($HOME.'/.vim/bundle/'))

" determine make or gmake will used for making addtionals deps for Bundles
let g:make = 'gmake'
if system('uname -o') =~ '^GNU/'
    let g:make = 'make'
endif

"----------------------------------------------
" Bundles

"Let NeoNeoBundle manage NeoNeoBundle
NeoBundle 'Shougo/neobundle.vim'

"---------=== Code/project navigation ===-------------
NeoBundle 'scrooloose/nerdtree'           " Project and file navigation
NeoBundle 'majutsushi/tagbar'             " Class/module browser
NeoBundle 'Lokaltog/vim-powerline' " status bar
NeoBundle 'tomtom/tcomment_vim'

""------------------=== Other ===----------------------
" Allow autoclose paired characters like [,] or (,),
" and add smart cursor positioning inside it
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'scrooloose/syntastic' " syntax checker
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle '29decibel/codeschool-vim-theme'
NeoBundle 'tomasr/molokai'
NeoBundle 'fmoralesc/vim-vitamins'
NeoBundle 'croaker/mustang-vim'

" Install jshint and csslint for syntastic
" Path to jshint if it not installed globally, then use local installation
if !executable("jshint")
   "let g:syntastic_jshint_exec = '~/.vim/node_modules/.bin/jshint'
   let g:syntastic_javascript_jshint_exec = '~/.vim/node_modules/.bin/jshint'
       if isNpmInstalled && !executable(expand(g:syntastic_javascript_jshint_exec))
           silent ! echo 'Installing jshint' && npm --prefix ~/.vim/ install jshint
       endif
endif
" Path to csslint if it not installed globally, then use local installation
if !executable("csslint")
  let g:syntastic_css_csslint_exec='~/.vim/node_modules/.bin/csslint'
       if isNpmInstalled && !executable(expand(g:syntastic_css_csslint_exec))
           silent ! echo 'Installing csslint' && npm --prefix ~/.vim/ install csslint
       endif
endif

" Code complete
NeoBundle 'Shougo/neocomplcache.vim'

"--------------=== Snippets support ===---------------
" snippets engine with good integration with neocomplcache
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'honza/vim-snippets'

""---------------=== Languages support ===-------------
" --- Python ---
NeoBundle 'klen/python-mode'            " Python mode (docs, refactor, lints, highlighting, run and ipdb and more)
NeoBundle 'mitsuhiko/vim-jinja'     " Jinja support for vim
NeoBundle 'vim-scripts/django.vim'
NeoBundle 'mitsuhiko/vim-python-combined'  " Combined Python 2/3 for Vim
NeoBundle 'davidhalter/jedi-vim'

" ---JavaScript ---
" Improve javascritp syntax higlighting, needed for good folding,
" and good-looking javascritp code
NeoBundle 'jelera/vim-javascript-syntax'
"Smart indent for javascript
NeoBundle 'lukaszb/vim-web-indent'
NeoBundle 'kchmck/vim-coffee-script'
"code-completion for jquery, lodash e.t.c
NeoBundle 'othree/javascript-libraries-syntax.vim'

" --- PHP ---
NeoBundle 'vim-scripts/php.vim--Garvin'
NeoBundle '2072/PHP-Indenting-for-VIm.git'

" --- CSS3/SCSS/LESS/HTML5/JSON ---
NeoBundle 'tpope/vim-surround' " Parentheses, brackets, quotes, XML tags, and more
NeoBundle 'mattn/emmet-vim'
NeoBundle 'hail2u/vim-css3-syntax' " CSS3 syntax support
NeoBundle 'ap/vim-css-color' " Highlight colors in css files
NeoBundle 'groenewege/vim-less'
NeoBundle 'miripiruni/vim-better-css-indent'
NeoBundle 'leshill/vim-json'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'cakebaker/scss-syntax.vim'
" HTML5 + inline SVG omnicomplete funtion, indent and syntax for Vim.
NeoBundle 'othree/html5.vim'
" Highlights the matching HTML tag when the cursor
" is positioned on a tag.
NeoBundle 'gregsexton/MatchTag'
" Plugin for changing cursor when entering in insert mode
" looks like it works fine with iTerm Konsole adn xerm
" Applies only on next vim launch after NeoBundleInstall
NeoBundle 'jszakmeister/vim-togglecursor'

call neobundle#end()
filetype plugin indent on
NeoBundleCheck

"=============BUNDLES SETTINGS===================

" Syntastic
" Enable autochecks
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1

" For correct works of next/previous error navigation
let g:syntastic_always_populate_loc_list = 1

" check json files with jshint
let g:syntastic_filetype_map = { "json": "javascript", }

" open quicfix window with all error found
nmap <silent> <leader>ll :Errors<cr>
" previous syntastic error
nmap <silent> [ :lprev<cr>
" next syntastic error
nmap <silent> ] :lnext<cr>

"-------------------------
" DelimitMate

" Delimitmate place cursor correctly n multiline objects e.g.
" if you press enter in {} cursor still be
" in the middle line instead of the last
let delimitMate_expand_cr = 1

" Delimitmate place cursor correctly in singleline pairs e.g.
" if x - cursor if you press space in {x} result will be { x } instead of {x}
let delimitMate_expand_space = 1

"-------------------------
" Tern_for_vim

let tern_show_signature_in_pum = 1

" " Find all refs for variable under cursor
nmap <silent> <leader>tr :TernRefs<CR>
"
" " Smart variable rename
nmap <silent> <leader>tn :TernRename<CR>

"-------------------------
" neosnippets

" Enable snipMate compatibility
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

" Disables standart snippets. We use vim-snippets bundle instead
let g:neosnippet#disable_runtime_snippets = { '_' : 1 }

" Expand snippet and jimp to next snippet field on Enter key.
imap <expr><CR> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<CR>"


"-------------------------
" neocomplcache

" " Enable NeocomplCache at startup
let g:neocomplcache_enable_at_startup = 1

" " Code complete is ignoring case until no Uppercase letter is in input
let g:neocomplcache_enable_smart_case = 1

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTag

" disable preview in code complete
set completeopt-=preview

" Disable choose first function/method at autocomplete
let g:jedi#popup_select_first = 0
let g:jedi#completions_command = "<C-Space>"
let g:jedi#popup_on_dot = 1

" bind tagbar
map <leader>z :Tagbar<CR>

"----------------------------------------------------
" Python-mode settings
" отключаем автокомплит по коду (у нас вместо него используется jedi-vim)
let g:pymode_rope = 0
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0

" документация
let g:pymode_doc = 0
let g:pymode_doc_key = 'K'

" проверка кода
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_ignore="E501,W601,C0110"

" провека кода после сохранения
let g:pymode_lint_write = 1

" поддержка virtualenv
let g:pymode_virtualenv = 1

" установка breakpoints
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" подстветка синтаксиса
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" отключить autofold по коду
let g:pymode_folding = 0

" возможность запускать код
let g:pymode_run = 0

" проверка кода в соответствии с PEP8 через <leader>8
autocmd FileType python map <buffer> <leader>8 :PymodeLint<CR>


"------------------------------------------------------
" NERDTree
" bind NERDTree
map <C-t> :NERDTreeToggle<CR>

" ignore .pyc files
let NERDTreeIgnore=['\.pyc$']


" ===================GENERAL SETTINGS=====================
if has('gui_running') " global settings of GUI Vim
    set guioptions-=m " remove the menu
    set guioptions-=e " remove GUI tabs
    set guioptions-=T " remove toolbar
    set guioptions-=r " remove right scrollbar
    set guioptions-=L " remove left scrollbar
    set guioptions-=R
    set guioptions-=l
endif

set nocompatible
set modelines=0

" Show whitespace
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

" Color scheme
set background=dark
syntax enable
set t_Co=256
" for macvim
set gfn=Monaco:h16
color solarized

" Setting for vim-powerline
set laststatus=2

" Do not add eol at the end of file.
set noeol

set noshowmode
" Highlight line with cursor
set cursorline

" Better copy & paste
set pastetoggle=<F2>
set clipboard=unnamed

" Auto reload changed files
set autoread

" sable backup and swap files
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

" encoding
set enc=utf-8

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
vnoremap < <gv
vnoremap > >gv

" Python folding
set nofoldenable

" bind Ctrl+<movement> keys to move around the windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" disable popups with docs
set completeopt-=preview

" Numbers of rows to keep to the left and to the right off the screen
set scrolloff=10

" Numbers of columns to keep to the left and to the right off the screen
set sidescrolloff=10
