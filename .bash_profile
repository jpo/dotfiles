# RBENV
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# PYENV
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# PATH
export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin"
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="/usr/local/share/npm/bin:$PATH"
export PATH="/usr/local/bin:$PATH"

# PROMPT
export PS1='\[\033[0;32m\]\h \[\033[0;33m\]\W\[\033[00m\]\[\033[01;00m\]$ '

# ALIASES
alias tmux='TERM=screen-256color-bce tmux'

# BASH COMPLETION
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

export NVM_DIR="$HOME/.nvm"
  . "$(brew --prefix nvm)/nvm.sh"
