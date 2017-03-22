[[ $- == *i* ]] && echo ".bash_profile is executed"

# ======================
# General Settings
# ======================
export PAGER=less
export VISUAL=vim
export EDITOR=vim
export CLICOLOR=1 # enable color display in terminal
export LESS='-M'

# File creation mask
umask 0077 # make this file private, restricting anyone else

# ======================
# Shell prompt
# ======================
export PS1="\[\033[01;32m\]\u@\[\033[01;38;5;011m\]\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$"

# ======================
# PATH settings
# ======================
export PATH="${PATH}:." # adding current working directory to the end of searching path
export PATH="${HOME}/bin:${PATH}"
export PATH="/usr/local/sbin:$PATH"

# Setting PATH for Python 2.7
export PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"

### Add environment path for mongodb
export PATH=/usr/local/lib/mongodb/bin:$PATH

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### Add environment path for mysql
export PATH="/usr/local/mysql/bin:$PATH"

### Add environment path for Python 3.4
export PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"

### Add environment path for Scala
export PATH="~/bin/scala-2.11.7/bin:${PATH}"

### Default options for utilities
export PATH=/home/scratch/root/torch/bin:$PATH

### Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# ======================
# Application specific
# ======================

# This section contains specific settings for applications.
# Feel free to remove if you don't use the application

### Add environment variables for postgreSQL
export PGDATA='/usr/local/var/postgres'
export PGHOST=localhost
alias start-pg='pg_ctl -l $PGDATA/server.log start'
alias stop-pg='pg_ctl stop -m fast'
alias show-pg-status='pg_ctl status'
alias restart-pg='pg_ctl reload'

 # Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# ===========================
# Load .bashrc in login shell
# ==========================
if [ -f ${HOME}/.bashrc ]
then source ${HOME}/.bashrc
fi
