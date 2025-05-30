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
xterm-color | *-256color) color_prompt=yes ;;
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
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm* | rxvt*)
  PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
  ;;
*) ;;
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

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
# if ! shopt -oq posix; then
#   if [ -f /usr/share/bash-completion/bash_completion ]; then
#     . /usr/share/bash-completion/bash_completion
#   elif [ -f /etc/bash_completion ]; then
#     . /etc/bash_completion
#   fi
# fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

export EDITOR='nvim'
export VISUAL='nvim'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('~/miniconda3/bin/conda' 'shell.bash' 'hook' 2>/dev/null)"
if [ $? -eq 0 ]; then
  eval "$__conda_setup"
else
  if [ -f "~/miniconda3/etc/profile.d/conda.sh" ]; then
    . "~/miniconda3/etc/profile.d/conda.sh"
  else
    export PATH="~/miniconda3/bin:$PATH"
  fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PS1='\[\e[38;5;160;1m\]\t \[\e[38;5;46m\]\u\n\[\e[0;38;5;39m\]\w\n\[\e[38;5;39m\]  \[\e[0m\]$()\[\e[0m\]'
# export PS1="\[\e[31;1m\]\t \[\e[032;1m\]\u \n\[\e[34;1m\]\w \[\e[37m\]\n>> "

function rem_image() {
  image_id=$1

  docker rm -f $(docker ps -a -q --filter="ancestor=$image_id") 2>&- || echo "Found no containers for that image"
  docker rmi $image_id
  echo "Image deleted successfully"
}

function docker_clean() {
  pattern=$1

  for image_id in $(docker images | grep $pattern | awk '{ print $3}'); do
    echo Removing... $image_id
    rem_image $image_id
  done
}

alias lsd="ls -d */"

alias lsc="~/dotfiles/filecount.sh"

lsh() {
  ls "$@" | head -n 10
}

# print X row in file with awk
# awk 'FNR==8{print;nextfile}' *.data

alias lsft="find . -name '*.?*' -type f | rev | cut -d. -f1 | rev  | tr '[:upper:]' '[:lower:]' | sort | uniq --count | sort -rn"

# source ~/dotfiles/print_cols.sh
alias print_cols="~/dotfiles/print_cols.sh"
alias sudoes="sudo -E -s"
alias lspwd="~/dotfiles/locate_pwd.sh"
alias eddyuh="cd /home/eerokos/opiskelu/eddy_course/code/eddyuh/ && /home/eerokos/opiskelu/eddy_course/code/eddyuh/run_EddyUH_linux64.sh /usr/local/MATLAB/MATLAB_Compiler_Runtime/v81/
"
alias chargetlp="sudo tlp setcharge 94 95 BAT0"
# script for running darktable export and image stack
if [ -d "../macropipe/" ]; then
  source /home/eerokos/macropipe/macropipe.sh
fi
. "$HOME/.cargo/env"
complete -f -X '!*.@(zip|ghg|data)' unzip
source ~/dotfiles/config/alacritty/alacritty.bash
alias vpnup="~/dotfiles/vpnup.sh"
alias pizza="python3 ~/dotfiles/pizza.py"
alias looper="~/dotfiles/10s.sh"
alias ram="~/dotfiles/ram_usage.sh"
alias swouts="swaymsg -t get_outputs"
alias swtree="swaymsg -t get_tree"
alias fdo="~/dotfiles/fdo.sh"
alias remeco="remmina-file-wrapper .local/share/remmina/group_rdp_ecoclimate-computer_130-231-149-70.remmina"
alias remac="remmina-file-wrapper .local/share/remmina/group_rdp_ac-computer_130-231-149-83.remmina"
alias remoeco="~/dotfiles/fdo.sh"
alias docker-compose="docker compose"
alias headtail="~/dotfiles/headtail.sh"
alias fd="fd -I"
export PATH="$PATH:$HOME/.local/bin:/usr/sbin"
export QT_QPA_PLATFORM=wayland
export PATH="$PATH:/usr/bin/gdal"
export PATH="$PATH:/usr/local/lib/x86_64-linux-gnu"
# export LD_LIBRARY_PATH=/usr/local/lib
export LD_LIBRARY_PATH="/lib:/usr/lib:/usr/local/lib"
export GDAL_DATA="/usr/share/gdal"
