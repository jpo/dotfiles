# Python Environment
export PYENV_ROOT="$HOME/.pyenv"
if command -v pyenv 1>/dev/null 2>&1; then
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi

# Ruby Environment
export RBENV_ROOT="$HOME/.rbenv"
if command -v rbenv 1>/dev/null 2>&1; then
  export PATH="$RBENV_ROOT/bin:$PATH"
  eval "$(rbenv init -)"
fi

# Bash Completion
if type brew 2&>/dev/null; then
  source "$(brew --prefix)/etc/bash_completion.d/brew"
  source "$(brew --prefix)/etc/bash_completion.d/git-completion.bash"
  source "$(brew --prefix)/etc/bash_completion.d/git-prompt.sh"

  GIT_PS1_SHOWDIRTYSTATE=true
  export PS1='\[\033[0;32m\]\h \[\033[0;33m\]\W\[\033[00m\]$(__git_ps1)\$ '
else
  export PS1='\[\033[0;32m\]\h \[\033[0;33m\]\W\[\033[00m\]\$ '
  echo "run: brew install bash-completion"
fi

# Update PATH
export PATH="$PATH:/Users/josh/.local/bin"
export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Use MacVim
alias vim='mvim -v'
