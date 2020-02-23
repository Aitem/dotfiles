# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

LANG=en_US.UTF-8

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

GPG_TTY=$(tty)
export GPG_TTY

# append to the history file, don't overwrite it
shopt -s histappend
source ~/.git-prompt.sh

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
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
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
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]:\u@\h\[\033[00m\]\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
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

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias bfg='java -jar /usr/local/bin/bfg-1.13.0.jar '
alias ll='ls -alh'
alias la='ls -A'
alias l='ls -CF'
alias tmux='tmux -2'
alias emacs='TERM=xterm-256color emacs --insecure'
alias emacs2='TERM=xterm-256color emacs --insecure'
alias gg='git pull'
alias gp='git push'
alias gaa='git add -A'
alias gc='git commit'
alias gco='git checkout '
alias gcm='git commit -m '
alias gs='git status'
alias gchm='git checkout master'
alias gchp='git checkout production'



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
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad

__kube_context ()
{
    kubectl config current-context
}
#export PS1="[\[\e[32m\]\A\[\e[0m\]] \[\e[32m\]\u\[\e[0m\]@\[\e[32m\]\h\[\e[0m\] \[\e[1;34m\]\w\[\e[0m\]\$(__git_ps1)> "
#export PS1="\\[\[\e[32m\]\A\[\e[0m\]] \[\e[32m\]\u\[\e[0m\]@\[\e[32m\]\h\[\e[0m\] \[\e[1;34m\]\w\[\e[0m\]\e[0;33m\]\$(__git_ps1)\e[0m\]> "

#export PS1="\[\033[38;5;2m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput sgr0)\]\[\033[38;5;11m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\]\[$(tput sgr0)\]\[\033[38;5;6m\][\w]\[$(tput sgr0)\]\[\033[38;5;15m\]\[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;208m\]\$(__git_ps1) \[$(tput sgr0)\]"
#export PS1="[\w]\[$(tput sgr0)\]\[\033[38;5;15m\]\[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;208m\]\$(__git_ps1) \[$(tput sgr0)\]"
# Time & path
# Path
# export PS1="\[\033[38;5;147m\]\[\$(__kube_context)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;6m\][\w]\[$(tput sgr0)\]\[\033[38;5;15m\]\[\033[38;5;208m\]\$(__git_ps1) \[$(tput sgr0)\]"
# export PS1="\[\e[0;32m\]\$(__kube_context)\[\e[0m\] \[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;6m\][\w]\[$(tput sgr0)\]\[\033[38;5;15m\]\[\033[38;5;208m\]\$(__git_ps1) \[$(tput sgr0)\]"
export PS1="\[\033[48;5;25m\]\$(__kube_context)\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;6m\] [\w]\[$(tput sgr0)\]\[\033[38;5;15m\]\[\033[38;5;208m\]\$(__git_ps1) \[$(tput sgr0)\]"



## Colorize the ls output ##
##alias ls='ls --color=auto'

## Use a long listing format ##
alias ll='ls -la'

## Show hidden files ##
alias l.='ls -d .* --color=auto'
alias vim='nvim'

# added by travis gem
[ -f /home/aitem/.travis/travis.sh ] && source /home/aitem/.travis/travis.sh

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export EDITOR='vim'

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$PATH:/usr/local/go/bin"  # Go lang
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/bin/kafka/bin"
export PATH="$PATH:/home/aitem/.go/bin"  # Go lang
export PATH="$PATH:/usr/bin/bin"  # node
export PATH="$PATH:/Users/aitem/bin"  # custom bin
export PATH="$PATH:/home/aitem/Android/Sdk/tools"
export PATH="$PATH:/usr/lib/postgresql/9.5/bin/"  # node
export PATH="$PATH:/Users/aitem/Library/Android/sdk/platform-tools"
export PATH=/usr/local/openresty/bin:$PATH
export PATH=/usr/local/openresty/bin:/usr/local/openresty/nginx/sbin:$PATH

export ANDROID_HOME=/home/aitem/Android/Sdk
# export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export GOROOT=/usr/local/go
export GOPATH=$HOME/.go
export NVM_DIR="$HOME/.nvm"
export SHELL=/bin/bash emacs
export PATH=$PATH:$GOROOT/bin

export PGPASSWORD=postgres
export CUDA_HOME=/usr/local/cuda
export DYLD_LIBRARY_PATH="$DYLD_LIBRARY_PATH:$CUDA_HOME/lib"
export PATH="$CUDA_HOME/bin:$PATH"

complete -W "\`grep -oE '^[a-zA-Z0-9_.-]+:([^=]|$)' Makefile | sed 's/[^a-zA-Z0-9_.-]*$//'\`" make

# added by travis gem
[ -f /Users/aitem/.travis/travis.sh ] && source /Users/aitem/.travis/travis.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/aitem/google-cloud-sdk/path.bash.inc' ]; then source '/Users/aitem/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
#export PATH="/usr/local/opt/curl/bin:$PATH"
#export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"

export PATH=/Users/aitem/.nvm/versions/node/v6.4.0/bin:/usr/local/opt/curl/bin:/Users/aitem/.cargo/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/MacGPG2/bin:/opt/X11/bin:/usr/local/opt/curl/bin:/Users/aitem/.cargo/bin:/usr/local/opt/openssl@1.1/bin:/Users/aitem/google-cloud-sdk/bin:/Users/aitem/bin:/Users/aitem/bin/kafka/bin:/Users/aitem/bin:/Users/aitem/bin/kafka/bin:/Users/aitem/bin:/Users/aitem/bin:/Users/aitem/bin/kafka/bin:/Users/aitem/bin
