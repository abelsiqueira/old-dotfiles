# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

setterm -blength 0

export BASHRC="$HOME/.bashrc"
export EDITOR="vim"
PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/vendor_perl:/usr/bin/core_perl"

# Check with ruby -e 'print Gem.user_dir'
PATH="$HOME/.gem/ruby/2.3.0/bin:$PATH"
#PATH="~/.rbenv/bin:$PATH"
PATH="$HOME/.linuxbrew/bin:$PATH"
PATH="$PATH:/opt/wine-staging/bin"
#MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
#INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"

export NOMAD_HOME=~/projetos/nomad.3.7.1
export PATH=$NOMAD_HOME/bin:$PATH

#### CUTEst
#export ARCHDEFS="$HOME/Libraries/archdefs"
#export CUTEST="$HOME/Libraries/cutest"
#export SIFDECODE="$HOME/Libraries/sifdecode"
#export MASTSIF="$HOME/Libraries/sif"
#export PATH="$CUTEST/bin:$SIFDECODE/bin:$PATH"
#export MANPATH="$CUTEST/man:$SIFDECODE/man:$MANPATH"
#export MYARCH="pc64.lnx.gfo"
####

export IPOPTDIR=$HOME/Libraries/CoinIpopt

#export ALGENCAN=$HOME/Libraries/algencan

#export OPENBLASDIR="$HOME/Libraries/OpenBLAS"
#export OPENBLASLIBS="$OPENBLASDIR/libopenblas.a $OPENBLASDIR/libopenblas.so -lgfortran -lgfortranbegin -lpthread"

#LIBSDIR="$HOME/Libraries"
#METISDIR="${LIBSDIR}/metis-4.0.3"
#TIMDAVISDIR="${LIBSDIR}"
#CHOLMODDIR="$TIMDAVISDIR/CHOLMOD"
#AMDDIR="$TIMDAVISDIR/AMD"
#CAMDDIR="$TIMDAVISDIR/CAMD"
#COLAMDDIR="$TIMDAVISDIR/COLAMD"
#CCOLAMDDIR="$TIMDAVISDIR/CCOLAMD"
#SSCONFIG="$TIMDAVISDIR/SuiteSparse_config"
#BMDIR="$LIBSDIR/base_matrices"
#DCICPPDIR="$LIBSDIR/dcicpp"
#MUMPSDIR="$LIBSDIR/MUMPS_4.10.0"

#TIMDAVISLIB="$CHOLMODDIR/Lib:$AMDDIR/Lib:$CAMDDIR/Lib:$COLAMDDIR/Lib:$CCOLAMDDIR/Lib:$SSCONFIG"
#METISLIB="$METISDIR"
#BMLIB="$BMDIR/Lib"
#CUTERLIB="$MYCUTER/double/lib"
#DCICPPLIB="$DCICPPDIR/Lib"
#MUMPSLIB="$MUMPSDIR/lib:$MUMPSDIR/PORD/lib:$MUMPSDIR/libseq"

#TIMDAVISI="$CHOLMODDIR/Include:$SSCONFIG"
#METISI="$METISDIR/Lib"
#BMI="$BMDIR/Include"
#CUTERI="$CUTER/common/include"
#DCICPPI="$DCICPPDIR/Include"
#MUMPSI="$MUMPSDIR/libseq:$MUMPSDIR/PORD/include:$MUMPSDIR/include"

#export LD_LIBRARY_PATH="/usr/local/lib:$TIMDAVISLIB:$METISLIB:$BMLIB:$CUTERLIB:$OPENBLASDIR:$DCICPPLIB:$MUMPSLIB"
#export LIBRARY_PATH="/usr/local/lib:$TIMDAVISLIB:$METISLIB:$BMLIB:$CUTERLIB:$OPENBLASDIR:$DCICPPLIB:$MUMPSLIB"
#export LIBPATH="/usr/local/lib:$TIMDAVISLIB:$METISLIB:$BMLIB:$CUTERLIB:$OPENBLASDIR:$DCICPPLIB"
#export CPLUS_INCLUDE_PATH="$TIMDAVISI:$METISI:$BMI:$CUTERI:$DCICPPI:$MUMPSI:$HOME/projetos/dfopt"
#export C_INCLUDE_PATH="$TIMDAVISI:$METISI:$BMI:$CUTERI:$DCICPPI:$MUMPSI:$HOME/projetos/dfopt"
#export INCLUDE_PATH="$TIMDAVISI:$METISI:$BMI:$CUTERI:$DCICPPI:$MUMPSI:$HOME/projetos/dfopt"

export LD_LIBRARY_PATH="/opt/ibm/ILOG/CPLEX_Studio1262/cplex/bin/x86-64_linux:$LD_LIBRARY_PATH"

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

export IPOPT="$IPOPTDIR/build"
export LD_LIBRARY_PATH="$IPOPT/lib:$LD_LIBRARY_PATH"
export ARCHDEFS=/home/abel/projetos/linux-cutest/archdefs
export CUTEST=/home/abel/projetos/linux-cutest/cutest
export SIFDECODE=/home/abel/projetos/linux-cutest/sifdecode
export MASTSIF=/home/abel/projetos/linux-cutest/mastsif
export MYARCH=pc64.lnx.gfo
export PATH=/home/abel/projetos/linux-cutest/cutest/bin:/home/abel/projetos/linux-cutest/sifdecode/bin:$PATH
export MANPATH=/home/abel/projetos/linux-cutest/cutest/man:/home/abel/projetos/linux-cutest/sifdecode/man:$MANPATH
export LD_LIBRARY_PATH=/home/abel/projetos/linux-cutest/lib:$LD_LIBRARY_PATH

#export ARCHDEFS=/home/abel/.linuxbrew/opt/archdefs/libexec
#export CUTEST=/home/abel/.linuxbrew/opt/cutest/libexec
#export SIFDECODE=/home/abel/.linuxbrew/opt/sifdecode/libexec
#export MYARCH=pc64.lnx.gfo

# added by travis gem
[ -f /home/abel/.travis/travis.sh ] && source /home/abel/.travis/travis.sh
eval "$(thefuck --alias fix)"
