" Use Vim settings rather than Vi settings.
" This must be first because it changes other options as a side effect.
set nocompatible

" Setup pathogen
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()
            
" Detect file types
filetype on
filetype indent on
filetype plugin on

" Turn on syntax highlighting
syntax on

" Set colorscheme
set background=dark
colorscheme distinguished

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

" Do not store backup or swap files.
set nobackup
set noswapfile

" Use unix style line endings.
set fileformat=unix

" Do not wrap long lines
set nowrap

" Show lines numbers
set number

" Highlight search results
set hlsearch

" Show autocomplete menu on command line
set wildmenu

" Tab Settings
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab

" Indent Settings
set autoindent
set smartindent

" Set List characters
set listchars=eol:$,nbsp:_,tab:>-,trail:~,extends:>,precedes:<

" Always show status line
set laststatus=2

" Set Status Line format
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%c,%l]
                
" Faster scrolling
set scrolljump=2

" File Type Settings
autocmd FileType python setlocal ts=4 sw=4
autocmd FileType ruby setlocal ts=2 sw=2
autocmd BufNewFile,BufRead *.m,*.h set ft=objc

" Plugin Settings
let g:bufExplorerShowRelativePath=1
let g:NERDShutUp = 1
let g:NERDTreeHijackNetrw = 0
let g:airline#extensions#tabline#enabled = 1

" Custom key bindings
let mapleader = ","
map <Leader>b :BufExplorer<CR>
map <Leader>e :Ex<CR>
map <Leader>f :FufFile **/<CR>
map <Leader>n :NERDTree<CR>
map <Leader>s <C-Z>

" GUI Settings
if has('gui_running')
  " Hide the toolbar
  set guioptions-=T

  " Set window height and width
  set lines=50 columns=100

  " Set colorscheme
  colorscheme railscasts

  " Set font
  if has("win32") || has("win64")
      set guifont=Consolas:h11:cANSI
  elseif has("mac")
      set guifont=Menlo\ Regular:h13.00
  else
      set guifont=Courier_New:h10:cDEFAULT
  endif
end
