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
Plug 'jlanzarotta/bufexplorer'
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tomasiser/vim-code-dark'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
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

set belloff=all   " Disable audible and visual bells

set number        " Show lines numbers

set hlsearch      " Highlight search results
set wildmenu      " Show autocomplete menu on command line

set autoindent    " Indent on enter
set smartindent   " Indent on new line

set expandtab     " Expand tabs to spaces
set tabstop=2     " Use 2 spaces for tabs
set shiftwidth=2  " Use 2 spaces for tabs

set splitbelow    " Split buffers below current

set clipboard=unnamed " Use clipboard on MacOS

" Fix delay caused by esckeys
" Reference: https://stackoverflow.com/questions/2158516/delay-before-o-opens-a-new-line#2158610
set timeoutlen=500

set backspace=indent,eol,start  " Allow backspacing over everything in insert mode
set listchars=eol:$,nbsp:_,tab:>-,trail:~,extends:>,precedes:<  " Chars to display in list mode

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
let g:airline_theme='dark'
let g:airline#extensions#tabline#enabled=1
let g:ctrlp_custom_ignore='node_modules\|DS_Store\|git'

" Custom key bindings
let mapleader = ","
map <Leader>b :BufExplorer<CR>
map <Leader>e :Ex<CR>
map <Leader>n :NERDTree<CR>
map <C-_> <plug>NERDCommenterToggle
vmap <C-_> <plug>NERDCommenterToggle<CR>gv

" Map Control-Backspace to delete the previous work in insert mode
inoremap <C-BS> <C-w>

" GUI Settings
if has('gui_running')
  set guioptions-=T       " Hide the toolbar
  set guifont=Consolas:h11,Monaco:h14,Inconsolata:h14
end

