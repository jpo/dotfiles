" The directory that contains your color schemes, plugins, scripts, etc. 
let s:runtime_path="~/Code/dotfiles/vim"

" The path to the vim-init file
let s:vim_init="~/Code/dotfiles/vim-init"

" The path to the gvim-init file
let s:gvim_init="~/Code/dotfiles/gvim-init"


" ===== DO NOT MAKE CHANGES BEYOND THIS POINT =====

" Set the directories to search to find runtime files. This tells Vim where 
" to find your color schemes, plugins, scripts, etc.
exec "set runtimepath=" . s:runtime_path . ",$VIMRUNTIME"

" Read the settings from the base configuration file.
exec "source " . s:vim_init

" Read the settings from the GUI configuration file if the GUI is running.
if has("gui_running")
  exec "source " . s:gvim_init
endif
