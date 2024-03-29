# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ ' # <- Backup
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\W\$ '
    #PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ ' #<- BU
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \W\a\]$PS1"
    #PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1" #<-BU
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# show time it took to complete last command
function timer_start {
  timer=${timer:-$SECONDS}
}

function timer_stop {
  last_command_duration=$(($SECONDS - $timer))
  limit=1
  if [ "$last_command_duration" -gt "$limit" ]; then
      printf -v timer_show "[$last_command_duration seconds]\n"
  else
      timer_show=""
  fi
  unset timer
}

trap 'timer_start' DEBUG

if [ "$PROMPT_COMMAND" == "" ]; then
  PROMPT_COMMAND="timer_stop"
else
  PROMPT_COMMAND="$PROMPT_COMMAND; timer_stop"
fi


# my stuff:
export PS1='\[\033[38;5;30m\]$timer_show\[\033[38;5;51m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput sgr0)\]\[\033[38;5;10m\]\h\[$(tput sgr0)\]\[\033[38;5;226m\] >> \W\[$(tput sgr0)\]\[\033[38;5;15m\]\\$\[$(tput sgr0)\] '

export EDITOR='vim'

if test -f ~/.local/share/lscolors.sh; then
  . ~/.local/share/lscolors.sh
fi
    
# export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init -)"

# export GOPATH=$HOME/go
export GOROOT=$HOME/go
# export GOPATH='/mnt/c/Users/e22-sargentzw/OneDrive - Elder High School/Code/Go/packages'
# export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export PATH="${GOROOT}/bin:${PATH}"
export GOPATH="${GOROOT}/bin:${PATH}"

# the following is stolen from https://askubuntu.com/a/87066

# If ~/.inputrc doesn't exist yet: First include the original /etc/inputrc
# so it won't get overriden
if [ ! -a ~/.inputrc ]; then echo '$include /etc/inputrc' > ~/.inputrc; fi

# Add shell-option to ~/.inputrc to enable case-insensitive tab completion
echo 'set completion-ignore-case On' >> ~/.inputrc

if test -f "$HOME/.cargo/env"; then
    . "$HOME/.cargo/env"
fi

export GPG_TTY=$(tty)
# GoLang
export GOROOT=/home/sarge/go
export PATH=$GOROOT/bin:$PATH
export GOPATH=/home/sarge/go/bin:/home/sarge/go/bin:/home/sarge/.cargo/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin
export PATH=$GOPATH/bin:$PATH
export PATH=/home/sarge/bin:$PATH
export PATH=/home/sarge/.local/bin:$PATH
