source $HOME/.zplug/init.zsh

zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"

zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

if ! zplug check; then
  zplug install
fi

zplug load


autoload -U compinit; compinit
autoload -U colors; colors

bindkey -e

setopt no_beep
setopt auto_cd
setopt auto_pushd
setopt auto_menu
setopt list_packed
setopt list_types
setopt pushd_ignore_dups

setopt correct
setopt magic_equal_subst
setopt complete_aliases
setopt extended_glob
unsetopt caseglob
setopt nonomatch

setopt extended_history
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_reduce_blanks

unsetopt promptcr

HISTFILE=$HOME/.zhistory
HISTSIZE=1000
SAVESIZE=100000


export LESS="-R"


case ${OSTYPE} in
  darwin*)
    alias ls="ls -GF"
    ;;
  linux*)
    alias ls="ls -F --color=auto"
    ;;
esac

alias la="ls -A"
alias ll="ls -l"

alias rm="gomi"
alias rd="gomi"

alias diff="colordiff -u"
alias grep="grep --color"

alias vi="nvim"
alias vim="nvim"

alias g="git"
alias gs="git status ."
alias gl="git log --oneline --graph --no-merges -7 --pretty=format:'%C(yellow)%h%Creset %C(Blue)%<(8)%ar%Creset %s' | cat"
alias ga="git add"
alias gc="git commit -m"
alias gp="git push"
alias gd="git diff"
alias gld="git branch -d $(git branch --merged | grep -v master | grep -v '*')"

case ${OSTYPE} in
  linux*)
    alias pbcopy='xsel --clipboard --input'
    alias pbpaste='xsel --clipboard --output'
    ;;
esac

alias mp3="youtube-dl -x --audio-format mp3 -o ~/Music/%(title)s.%(ext)s"
alias mp4="youtube-dl --format 'best[ext=mp4]' -o ~/Videos/%(title)s.%(ext)s"

function flv2mp4() {
  ffmpeg -i $1 -codec copy ${1%.flv}.mp4
}

function mp42mp3() {
  ffmpeg -i $1 -ab 256k ${1%.mp4}.mp3
}
