set nocompatible
filetype off

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

"Keep Plugin commands between vundle#begin/end.
call vundle#begin()


"let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
"Plugin 'itchyny/lightline.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ryanoasis/vim-devicons'

"plugins from file


"All of your Plugins must be added before the following line
call vundle#end()


"enable syntax and plugins (for netrw)
syntax enable
filetype plugin indent on


set clipboard=unnamed
set encoding=UTF-8
set ignorecase              "Use case insensitive search 
set smartcase               "Except when using capital letters
set incsearch               "Set incremental search
set hlsearch                "Highlight search
set noswapfile              "Don't use swapfile
set nobackup		    "Don't create backup files
set nowritebackup 
set autoread                "Automatically reread changed files without asking 
"set number                  "Show line number

"FINDING FILES:

"Search down into subfolders
"Provided tab-completion for all file-related tasks
set path+=**
"Display all matching files when we tab complete
set wildmenu

"Do not recognize octal numbers for Ctrl-A and Ctrl-X, most users find it confusing.
set nrformats-=octal

"suppress duplicate information shown on the lightline or airline
set noshowmode

set laststatus=2


"USE SNIPPETS:
"below an example
"nnoremap ,java :read $HOME/hello.txt<CR>



"---------- Mappings -------------------------------

"Map leader to Space
let mapleader = " "

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy, which is the default
map Y y$
"Do not show stupid q: window
map q: :q
"Windows switching
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"Save file as sudo when vim was not started as sudo
cmap w!! w !sudo tee > /dev/null %


"Map <C-L> (redraw screen) to also turn off search hl until the next search 
"nnoremap <C-L> :nohl<CR><C-L>  "conflicts with windows switching
map <leader><space> :nohl<CR>

nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

"==================== Fugitive ====================

nnoremap <leader>gs :Git<CR>
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gp :Git push<CR>
nnoremap <leader>gb :Git blame<CR>
nnoremap <leader>gl :Git log<CR>

"=================== NerdTree =====================

nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
"Automatically close NERDTree when you open a file
"let NERDTreeQuitOnOpen=1

"=================== Lightline ===================

let g:lightline = {
\ 'colorscheme': 'wombat',
\ 'active': {
\ 'left': [ [ 'mode', 'paste' ],
\ [ 'readonly', 'filename', 'modified', 'gitbranch' ] ],
\ 'right': [ [ 'lineinfo' ],
\ [ 'percent' ],
\ [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ] ]
\ },
\ 'component': {
\ 'gitbranch': "%{fugitive#head()}",
\ 'charvaluehex': '0x%B'
\ },
\ }

"=================== Airline =====================
"List the extensions to be enabled or ..
".. comment out to autoload all the available extensions (performance!)
let g:airline_extensions = ["tabline","fugitiveline","branch"]

let g:airline#extensions#fugitiveline#enabled = 1
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '>'
let g:airline_powerline_fonts = 1
let g:airline_theme='papercolor'
