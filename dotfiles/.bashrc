################################################################################
#                                                                              #
#                   ██████╗  █████╗ ███████╗██╗  ██╗ ██████╗                   #
#                   ██╔══██╗██╔══██╗██╔════╝██║  ██║██╔════╝                   #
#                  ╔██████╔╝███████║███████╗███████║██║                        #
#                  ║██╔══██╗██╔══██║╚════██║██╔══██║██║                        #
#                ██║██████╔╝██║  ██║███████║██║  ██║╚██████╗                   #
#                ╚═╝╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝ ╚═════╝                   #
#                                                                              #
################################################################################

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# Set History format to include timestamps
HISTTIMEFORMAT="%d/%m/%y %T"

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# Set History stop
# set +o history

# Don't put duplicate lines in the history and do not add lines that start with a space
export HISTCONTROL=erasedups:ignoredups:ignorespace

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
xterm-color | *-256color) color_prompt=yes ;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

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
    prompt_color='\[\033[1;31m\]'
    user_color='\[\033[0m\]'
    host_color='\[\033[1;94m\]'
    symbol_color='\[\033[1;33m\]'
    info_color='\[\033[1;33m\]'
    prompt_symbol=@
    if [ "$EUID" -eq 0 ]; then # Change prompt colors for root user
        prompt_color='\[\033[1;32m\]'
        info_color='\[\033[1;33m\]'
        prompt_symbol=@
    fi
    PS1=$prompt_color'┌──${debian_chroot:+($debian_chroot)──}('$info_color''$user_color'\u'$symbol_color'${prompt_symbol}'$host_color'\h'$prompt_color')-[\[\033[1;32m\]\w'$prompt_color']\n'$prompt_color'└─'$info_color'\$\[\033[0m\] '
    # BackTrack red prompt
    # PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\# '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm* | rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*) ;;

esac

# enable color support of ls, less and man, and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

    alias reload=". ~/.bashrc"
    alias ..="cd .."
    alias c="clear"
    alias cp="cp --recursive --preserve=all --verbose"
    alias mv="mv --no-clobber --verbose"
    alias l="clear && ls --almost-all -C --ignore='lost+found'"
    alias ll="clear && ls --almost-all -C --no-group -l --ignore='lost+found'"
    alias ls="clear && ls --color=auto --human-readable --sort='extension' --ignore='lost+found'"
    alias t="clear && tree -aAc"
    alias tt="clear && tree -aAcDgpRu"

    # Less colors for man pages
    export LESS_TERMCAP_mb=$'\E[1;31m'  # begin blink
    export LESS_TERMCAP_md=$'\E[1;94m'  # begin bold
    export LESS_TERMCAP_me=$'\E[0m'     # reset bold/blink
    export LESS_TERMCAP_so=$'\E[01;33m' # begin reverse video
    export LESS_TERMCAP_se=$'\E[0m'     # reset reverse video
    export LESS_TERMCAP_us=$'\E[1;32m'  # begin underline
    export LESS_TERMCAP_ue=$'\E[0m'     # reset underline

    # Take advantage of $LS_COLORS for completion as well
    LS_COLORS="di=36:ln=35:so=31:pi=33:ex=32:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"

fi

# Enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Exports definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_exports, instead of adding them here directly.
if [ -f ~/.bash_exports ]; then
    . ~/.bash_exports
fi

# Snippets definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_exports, instead of adding them here directly.
if [ -f ~/.bash_snippets ]; then
    . ~/.bash_snippets
fi
