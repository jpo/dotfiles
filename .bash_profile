# Anaconda Environment
CONDA_ROOT="~/anaconda3"
if [ -d $CONDA_ROOT ]; then
  export PATH="$CONDA_ROOT/bin:$PATH"
fi

# Node Environment
NVM_DIR="~/.nvm"
if [ -d $NVM_DIR ]; then
  export NVM_DIR
  . "/usr/local/opt/nvm/nvm.sh"
fi

# Python Environment
PYENV_ROOT="~/.pyenv"
if [ -d $PYENV_ROOT ]; then
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi

# Ruby Environment
RBENV_ROOT="~/.rbenv"
if [ -d $RBENV_ROOT ]; then
  export PATH="$RBENV_ROOT/bin:$PATH"
  eval "$(rbenv init -)"
fi

# PATH
export PATH="/usr/local/bin:$PATH"

# ALIASES
alias tmux='TERM=screen-256color-bce tmux'

# BASH COMPLETION
if type brew 2&>/dev/null; then
  source "$(brew --prefix)/etc/bash_completion"
  source "$(brew --prefix)/etc/bash_completion.d/git-completion.bash"
  source "$(brew --prefix)/etc/bash_completion.d/git-prompt.sh"

  GIT_PS1_SHOWDIRTYSTATE=true
  export PS1='\[\033[0;32m\]\h \[\033[0;33m\]\W\[\033[00m\]\[\033[01;00m\]$(__git_ps1)\$ '
else
  export PS1='\[\033[0;32m\]\h \[\033[0;33m\]\W\[\033[00m\]\[\033[01;00m\]\$ '
  echo "run: brew install bash-completion"
fi

