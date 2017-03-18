# .bashrc is loaded when bsah is run as interactive & non-login.
# But most of the time we still want to load bash in login shell.
# Thus we need to manually source it from ~/.bash_profile.

# It's a good practice to guard output from this file with [[ $- == *i* ]].

[[ $- == *i* ]] && echo ".bashrc is execued"

# ======================
# Shell options
# ======================
set -o ignoreeof
set -o emacs
set -o noclobber

# ======================
# Aliases
# ======================
alias ll='ls -l'
alias la='ls -a'
alias ls='ls -F' # always add a symbol to show file type
alias a=alias
alias h=history
alias grep='grep -E' # force grep to behave as egrep, allowing extended regular expressions
alias vw='view' # use read-only mode of vim to view a file

alias ..='cd ..'
alias ...='cd ../..'

# alias for tmux
alias tks='tmux kill-session -t'
alias tls='tmux ls'
alias trs='tmux rename-session -t'
alias tas='tmux attach-session -t'

# alias for todo-txt
alias td='todo'
alias tdl='todo ls'
alias tda='todo add'

# alias for homebrew's coreutils
alias readlink='greadlink'

# alias for vim
alias vimn='vim -u NONE'

# alias for git
alias gs='git status'   # this overrides the ghost script utility
alias ga='git add'
alias gc='git commit -m'
alias gd='git diff'

