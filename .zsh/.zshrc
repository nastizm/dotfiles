## load user .zshrc configuration file
#
[ -f ${HOME}/.zsh/.zshrc.mine ] && source ${HOME}/.zsh/.zshrc.mine

## Environment variable configuration
#
# LANG
#
export LANG=ja_JP.UTF-8
case ${UID} in
0)
    LANG=C
    ;;
esac

export EDITOR='vim'

# #Default shell configuration
#
# set prompt
#
autoload colors
colors

#
# auto change directory
#
setopt auto_cd

# auto directory pushd that you can get dirs list by cd -[tab]
#
setopt auto_pushd

# command correct edition before each completion attempt
#
setopt correct

# compacked complete list display
#
setopt list_packed

# no remove postfix slash of command line
#
setopt noautoremoveslash

# no beep sound when complete list displayed
#
setopt nolistbeep
setopt no_beep

## Keybind configuration
#
# emacs like keybind (e.x. Ctrl-a gets to line head and Ctrl-e gets
#   to end) and something additions
#
bindkey -e
bindkey "^[[1~" beginning-of-line # Home gets to line head
bindkey "^[[4~" end-of-line # End gets to line end
bindkey "^[[3~" delete-char # Del

# historical backward/forward search with linehead string binded to ^P/^N
#
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end

# reverse menu completion binded to Shift-Tab
#
bindkey "\e[Z" reverse-menu-complete


## Command history configuration
#
HISTFILE=${HOME}/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data


## zsh editor
#
autoload zed


## Prediction configuration
#
#autoload predict-on
#predict-off


## Alias configuration
#
# expand aliases before completing
#
setopt complete_aliases     # aliased ls needs if file/dir completions work

alias where="command -v"
alias j="jobs -l"

case "${OSTYPE}" in
freebsd*|darwin*)
    alias ls="ls -G -w"
    ;;
linux*)
    alias ls="ls --color"
    ;;
esac

alias la="ls -a"
alias lf="ls -F"
alias ll="ls -l"

alias du="du -h"
alias df="df -h"

alias su="su -l"

#
## terminal configuration
#
case "${TERM}" in
screen)
    TERM=xterm
    ;;
esac

unset LSCOLORS
case "${TERM}" in
xterm)
  export TERM=xterm-color
  ;;
kterm)
  export TERM=kterm-color
  # set BackSpace control character
  stty erase
  ;;
cons25)
  unset LANG
  export LSCOLORS=ExFxCxdxBxegedabagacad
  export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
  zstyle ':completion:*' list-colors \
    'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
  ;;
esac

# set terminal title including current directory
#
case "${TERM}" in
kterm*|xterm*)
    export LSCOLORS=ExFxCxdxBxegedabagacad
    export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    export ZLS_COLORS=$LS_COLORS
    zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
  ;;
esac


autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
PROMPT="%{${fg[yellow]}%}%~%{${reset_color}%} 
(*ﾟｰﾟ)< "
RPROMPT="%1(v|%F{green}%1v%f|)"


#============================
# command line stack
# change bindkey C-q
#============================
show_buffer_stack() {
  POSTDISPLAY="
stack: $LBUFFER"
  zle push-line-or-edit
}
zle -N show_buffer_stack
setopt noflowcontrol
bindkey '^Q' show_buffer_stack


#=============================
# source auto-fu.zsh
#=============================
#if [ -f ~/dotfiles/submodule/auto-fu/auto-fu.zsh ]; then
#    source ~/dotfiles/submodule/auto-fu/auto-fu.zsh
#    function zle-line-init () {
#        auto-fu-init
#    }
#    zle -N zle-line-init
#    zstyle ':auto-fu:highlight' input bold
#    zstyle ':auto-fu:highlight' completion fg=white
#    zstyle ':auto-fu:var' postdisplay ''
#
#    function afu+cancel () {
#        afu-clearing-maybe
#        ((afu_in_p == 1)) && { afu_in_p=0; BUFFER="$buffer_cur" }
#    }
#    function bindkey-advice-before () {
#        local key="$1"
#        local advice="$2"
#        local widget="$3"
#        [[ -z "$widget" ]] && {
#            local -a bind
#            bind=(`bindkey -M main "$key"`)
#            widget=$bind[2]
#        }
#        local fun="$advice"
#        if [[ "$widget" != "undefined-key" ]]; then
#            local code=${"$(<=(cat <<"EOT"
#                function $advice-$widget () {
#                    zle $advice
#                    zle $widget
#                }
#                fun="$advice-$widget"
#EOT
#            ))"}
#            eval "${${${code//\$widget/$widget}//\$key/$key}//\$advice/$advice}"
#        fi
#        zle -N "$fun"
#        bindkey -M afu "$key" "$fun"
#    }
#    bindkey-advice-before "^G" afu+cancel
#    bindkey-advice-before "^[" afu+cancel
#    bindkey-advice-before "^J" afu+cancel afu+accept-line
#fi



#=============================
# cdr
#=============================
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':chpwd:*' recent-dirs-max 5000
zstyle ':chpwd:*' recent-dirs-default yes
zstyle ':completion:*' recent-dirs-insert both


#=============================
# zaw
#=============================
if [ -f ~/dotfiles/submodule/zaw/zaw.zsh ]; then
  source ~/dotfiles/submodule/zaw/zaw.zsh
  zstyle ':fil-er-select' case-insensitive yes # 絞り込みをcase-insensitiveに
  bindkey '^xb' zaw-git-branches
  bindkey '^xd' zaw-cdr
  bindkey '^xh' zaw-history
fi


#=============================
# tmux
#=============================
#Start tmux on every shell login
#https://wiki.archlinux.org/index.php/Tmux#Start_tmux_on_every_shell_login
#if which tmux 2>&1 >/dev/null; then
    #if not inside a tmux session, and if no session is started, start a new session
#    test -z "$TMUX" && (tmux attach || tmux new-session)
#fi

fpath=(~/.zsh/completion $fpath)
autoload -U compinit
compinit -u


