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

# PROMPT
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\033[0;32m\]\h \[\033[0;33m\]\W\[\033[00m\]\[\033[01;00m\]$(__git_ps1)\$ '

# ALIASES
alias tmux='TERM=screen-256color-bce tmux'

# BASH COMPLETION
if type brew 2&>/dev/null; then
  source "$(brew --prefix)/etc/bash_completion"
  source "$(brew --prefix)/etc/bash_completion.d/git-completion.bash"
  source "$(brew --prefix)/etc/bash_completion.d/git-prompt.sh"
else
  echo "run: brew install bash-completion"
fi

# added by Anaconda3 5.3.1 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/Users/josh/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/Users/josh/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/josh/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/Users/josh/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<
