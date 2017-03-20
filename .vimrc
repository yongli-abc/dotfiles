"===============================================================
"" Vundle & Plugins
"===============================================================
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')

" Add plugins after this line
""""""""""""""""""""""""""
Plugin 'gmarik/Vundle.vim'
" " let Vundle manage Vundle, required

""""""""""""""""""""
Plugin 'dracula/vim'

""""""""""""""""""""""""""
Plugin 'bling/vim-airline'
set laststatus=2
"set timeoutlen=50 " this is conflicting with emmet-vim
let g:airline_theme='dark'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' ' " separator character used for the current buffer in tabline
let g:airline#extensions#tabline#left_alt_sep = ' ' " separator character used for inactive buffer in tabline
let g:airline#extensions#tabline#buffer_nr_show = 1 " number buffers in tabline
" let g:airline_powerline_fonts = 1 " this never worked well for me

""""""""""""""""""""""""""""
Plugin 'scrooloose/nerdtree'
nmap <C-N> :NERDTreeToggle<CR>

let g:NERDTreeMapOpenInTabSilent = '<2-LeftMouse>'
let NERDTreeWinSize=32
let g:NERDTreeShowBookmarks=1

autocmd StdinReadPre * let s:std_in=1                                       " Open NERDTree automatically when vim starts if no files
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif "   are specified

autocmd VimEnter * wincmd p " auto focus on document after opening
" close vim if the only window left is a NERDTree
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" enable line numbers
let NERDTreeShowLineNumbers=1
" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber

"""""""""""""""""""""""""""""""""
Plugin 'scrooloose/nerdcommenter'

"""""""""""""""""""""""
Plugin 'xolox/vim-misc'

"""""""""""""""""""""""""""
Plugin 'xolox/vim-easytags'

" The following plugins are not useful for me currently
" Plugin 'pangloss/vim-javascript'

" Plugin 'majutsushi/tagbar'
" nmap <F8> :TagbarToggle<CR>
" " Add support for markdown files in tagbar.
" " with the vimwiki plugin, filetype for markdown files have been changed to 'vimwiki'
" let g:tagbar_type_vimwiki = {
"             \ 'ctagstype': 'vimwiki',
"             \ 'ctagsbin' : '/Users/neilli1992/lib/markdown2ctags/markdown2ctags.py',
"             \ 'ctagsargs' : '-f - --sort=yes',
"             \ 'kinds' : [
"             \ 's:sections',
"             \ 'i:images'
"             \ ],
"             \ 'sro' : '|',
"             \ 'kind2scope' : {
"             \ 's' : 'section',
"             \ },
"             \ 'sort': 0,
"             \ }

" Plugin 'elzr/vim-json'
" Plugin 'digitaltoad/vim-jade'
" Plugin 'mattn/emmet-vim'
" Plugin 'tpope/vim-fugitive'
" Plugin 'tpope/vim-surround'
" Plugin 'wookiehangover/jshint.vim'
" Plugin 'toyamarinyon/vim-swift'
" Plugin 'tpope/vim-obsession'
" Plugin 'neilagabriel/vim-geeknote'

" Plugin 'vimwiki/vimwiki'
" register a wiki site
" let cs_wiki = {}
" let cs_wiki.path = '~/cs_notes/'
" let cs_wiki.syntax =  'markdown'
" let cs_wiki.ext = '.md'

" let g:vimwiki_list = [cs_wiki]

" Plugin 'derekwyatt/vim-scala'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


"===============================================================
"" Basic Setup
"===============================================================
"" Encoding
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set fileencodings=utf-8
set termencoding=utf-8
set bomb
set ttyfast

"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs
set expandtab " Use spaces instead of tabs
set shiftwidth=4 " 1 tab == 4 spaces
set tabstop=4
set softtabstop=4
set smarttab " Be smart when using tabs
set smartindent " Automatically inserts indentation in some cases
set autoindent
set cindent

"" Linebreak on 500 characters
set linebreak
set textwidth=500

"" Searching
set hlsearch
set incsearch " use increment search by default
set ignorecase
set smartcase " when all search patterns in small case, ignore. When uppercase exists, do not ignore

"" Change leader to ,
let mapleader=','

"" Get rid of swp files
set nobackup
set noswapfile
set nowritebackup " don't want a backup file while editing

"" Fileformats
set fileformats=unix,dos,mac

"" Show normal mode command in status line
set showcmd

"" Session management
let g:session_directory = "~/.vim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

"" show autocompletion menu in ex mode
set wildmenu

if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif

"===============================================================
"" Visual Appearance
"===============================================================
color dracula
syntax on " otherwise, no syntax highlighting at all

set ruler
set relativenumber " show relative line number
set number         " but on current line only, still show absolute line number, instead of 0

set scrolloff=3 " always leave 3 lines at the top/bottom of the screen

set laststatus=2 " show vim status bar

set backspace=2 "Fix the backspace problem in vim 7.4

"===============================================================
"" Visual Appearance
"===============================================================
"" no one is really happy until you have this shortcuts
"" these are all very easily mis-capitalized letters
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

"===============================================================
"" Mappings
"===============================================================
"" navigate within panels
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

"===============================================================
"" Misc
"===============================================================
:command FormatJSON %!python -m json.tool " Define a command for formatting JSON
:command Fold :setlocal foldmethod=syntax
autocmd BufWritePre * :%s/\s\+$//e " Automatically remove trailing whitespaces when :w

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o " disable auto commenting when opening a new line below a commented line

cnoremap <expr> %% getcmdtype( ) == ':' ? expand('%:h').'/' : '%%'

autocmd! FileType c,cpp,java,php call CSyntaxAfter()

"" Filetype recognition
au BufNewFile,BufRead *.yaml,*.yml so ~/.vim/ftplugin/yaml.vim " recognize yaml filetype, and source yaml.vim
au BufNewFile,BufRead *.ispl setfiletype ispl
