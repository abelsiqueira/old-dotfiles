# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

setterm -blength 0

export EDITOR="vim"
PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/vendor_perl:/usr/bin/core_perl"
PATH="$PATH:~/go/bin"
export RUBYOPT='-W:no-deprecated'

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=10000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

date +"%a - %d/%m/%y - %H:%M:%S"
if [ -x /bin/todo -o -x /usr/bin/todo ]; then
  todo
else
  if [ -x /bin/task -o -x /usr/bin/task ]; then
    task
  fi
fi
#echo -e "\e[0;32m$USER@$HOSTNAME"

if [ -f ~/.bash_prompt -a -n "$DISPLAY" ]; then
  source ~/.bash_prompt
else
  PS1='[\t]\w\n\u@\H\$ '
fi

#eval "$(rbenv init -)"
stty -ixon

# added by travis gem
[ -f /home/abel/.travis/travis.sh ] && source /home/abel/.travis/travis.sh

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
export PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin"

[ -f ~/.github_auth ] && source ~/.github_auth
export PATH="/home/abel/.local/bin:$PATH"
