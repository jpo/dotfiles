# Node Environemtn
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

# Python Environment
PYENV_ROOT="~/.pyenv"
CONDA_ROOT="~/anaconda3"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$CONDA_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Ruby Environment
RBENV_ROOT="~/.rbenv"
export PATH="$RBENV_ROOT/bin:$PATH"
eval "$(rbenv init -)"

# PATH
export PATH="/usr/local/bin:$PATH"

# PROMPT
export PS1='\[\033[0;32m\]\h \[\033[0;33m\]\W\[\033[00m\]\[\033[01;00m\]$ '

# ALIASES
alias tmux='TERM=screen-256color-bce tmux'

# BASH COMPLETION
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

