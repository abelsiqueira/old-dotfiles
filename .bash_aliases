#functions
function repeat() {
  while /bin/true; do clear; $1; sleep 0.3; done
}
function calc() {
  echo "scale=5; $1" | bc
}
alias findswp='find . -name "*.sw[op]"'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias less='less -R'

alias git-diff='git diff --color-words'

alias q='exit'
alias h='history'
alias ..='cd ..'
alias rmtemp='find . -name "*~" | while read file; do rm -f "$file"; done'
alias srcrc='source ~/.bashrc'

alias ls='ls -h --color=auto'
alias ll='ls -l --group-directories-first'
alias la='ls -A'
alias lla='ll -A'
alias lsdir='ls -d */'
alias lx='ls -lXB'
alias lsize='ls -lSr'
alias ltime='ls -ltcr'
alias ldate='ls -ltr'
alias lr='ls -lR'
alias tree='tree -Csu'
alias grep='grep --color'
alias l='ls'
alias list='ls -1'
alias lsexec='ls -F | grep "*"'

alias df='df -Th'
alias du='du -h'
alias dusort='du -s -BM * | sort -n'
alias free='free -h'
alias cache_clear='sudo sh -c "sync; echo 3 > /proc/sys/vm/drop_caches" '
alias sort='LC_ALL=C sort'

alias editbash='vim ~/.bashrc'
alias editalias='vim ~/.bash_aliases'

alias mkthislst='find . -name "*.mp3" | sort > this.lst'
alias playmp3='mpg123 -C'
alias randomplay='mpg123 -CZ'
alias randomplaythis='mpg123 -CZ --list this.lst'
alias playthis='mpg123 -C --list this.lst'

alias c='clear'
