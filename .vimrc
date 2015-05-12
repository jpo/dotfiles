autocmd!
set nocompatible  " Use Vim settings rather than Vi.

filetype on         " Detect file types
filetype indent on  " Load file-specific indent files
filetype plugin on  " Load file-specific plugin files

syntax on           " Enable syntax highlighting

" Set colorscheme
set background=dark
colorscheme railscasts

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

set backspace=indent,eol,start  " Allow backspacing over everything in insert mode
set listchars=eol:$,nbsp:_,tab:>-,trail:~,extends:>,precedes:<  " Chars to display in list mode

set laststatus=2  " Always show status line
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%c,%l]  " Status line format

set fileformat=unix  " Use unix style line endings

" Commands
au BufWritePost .vimrc so $MYVIMRC          " Autoload .vimrc after saving
au BufNewFile,BufRead *.m,*.h set ft=objc   " Set *.m & *.c files to ObjectiveC
au FileType python setlocal ts=4 sw=4       " Set tabs for Python
au FileType ruby setlocal ts=2 sw=2         " Set tabs for Ruby

" Plugin Settings
let g:bufExplorerShowRelativePath=1
let g:NERDShutUp=1
let g:NERDTreeHijackNetrw=0
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
  set guioptions-=T        " Hide the toolbar
  set lines=50 columns=100 " Set window height and width

  if has("win32") || has("win64")
      set guifont=Consolas:h11:cANSI        " Set font for Windows
  elseif has("mac")
      set guifont=Menlo\ Regular:h13.00     " Set font for Mac
  else
      set guifont=Courier_New:h10:cDEFAULT  " Set font for everything else
  endif
end
