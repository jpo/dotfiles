# RBENV
eval "$(rbenv init -)"

# GIT
parse_git_branch (){
  git name-rev HEAD 2> /dev/null | sed 's#HEAD\ \(.*\)#[\1]#'
}

export PS1='\[\033[0;32m\]\h \[\033[0;33m\]\W\[\033[00m\]\[\033[01;00m\]$(parse_git_branch): '

# READLINE
set -o vi
