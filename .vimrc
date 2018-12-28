autocmd!
set nocompatible  " Use Vim settings rather than Vi.

" Set environment variables
if has('win32') || has('win64')
  let $VIMHOME = $HOME.'/vimfiles'
else
  let $VIMHOME = $HOME.'/.vim'
endif

" Install vim-plug if not installed already
if empty(glob($VIMHOME.'/autoload/plug.vim'))
  silent execute '!curl -fLo '.$VIMHOME.'/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Define Plugins
call plug#begin($VIMHOME.'/plugged')
Plug 'tomasiser/vim-code-dark'
Plug 'ervandew/supertab'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'vim-scripts/bufexplorer.zip'
Plug 'vim-scripts/indentpython.vim'
Plug 'vim-scripts/SearchComplete'
Plug 'bling/vim-airline'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
call plug#end()


" Vim Configuration
filetype on         " Detect file types
filetype indent on  " Load file-specific indent files
filetype plugin on  " Load file-specific plugin files

syntax on           " Enable syntax highlighting

" Set colorscheme
set background=dark
colorscheme codedark

set encoding=utf-8

set nobackup      " No backup files
set noswapfile    " No swap files
set nowrap        " No line wrapping

set number        " Show lines numbers

set hlsearch      " Highlight search results
set wildmenu      " Show autocomplete menu on command line

set autoindent    " Indent on enter
set smartindent   " Indent on new line

set expandtab     " Expand tabs to spaces
set tabstop=2     " Use 2 spaces for tabs

set shiftwidth=2  " Use 2 spaces for tabs

" Fix delay caused by esckeys
" Reference: https://stackoverflow.com/questions/2158516/delay-before-o-opens-a-new-line#2158610
set timeoutlen=100

set backspace=indent,eol,start  " Allow backspacing over everything in insert mode
set listchars=eol:$,nbsp:_,tab:>-,trail:~,extends:>,precedes:<  " Chars to display in list mode

set laststatus=2  " Always show status line
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%c,%l]  " Status line format

set fileformats=unix,dos,mac  " Try to detect fileformats

" Commands
au BufWritePost .vimrc so $MYVIMRC          " Autoload .vimrc after saving
au BufNewFile,BufRead *.m,*.h set ft=objc   " Set *.m & *.c files to ObjectiveC
au FileType python setlocal ts=4 sw=4       " Set tabs for Python
au FileType ruby setlocal ts=2 sw=2         " Set tabs for Ruby

" Plugin Settings
let g:bufExplorerShowRelativePath=1
let g:NERDShutUp=1
let g:NERDTreeHijackNetrw=0
let g:NERDTreeNodeDelimiter="\u00a0"
let g:airline_theme='codedark'
let g:airline#extensions#tabline#enabled=1

" Custom key bindings
let mapleader = ","
map <Leader>b :BufExplorer<CR>
map <Leader>e :Ex<CR>
map <Leader>f :CtrlP<CR>
map <Leader>n :NERDTree<CR>
map <Leader>s <C-Z>

" GUI Settings
if has('gui_running')
  set guioptions-=T       " Hide the toolbar
  set lines=36 columns=80 " Set window height and width
  set guifont=Consolas:h11,Monaco:h14,Inconsolata:h14
end
