# RBENV
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# PATH
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/share/npm/bin:$PATH"
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="/Applications/Postgres.app/Contents/MacOs/bin:$PATH"

# PROMPT
# export PS1='\[\033[0;32m\]\h \[\033[0;33m\]\W\[\033[00m\]\[\033[01;00m\]$(__git_ps1): '
export PS1='\[\033[0;32m\]\h \[\033[0;33m\]\W\[\033[00m\]\[\033[01;00m\]$ '

# ALIASES
alias tmux='TERM=screen-256color-bce tmux'

# BASH COMPLETION
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi
