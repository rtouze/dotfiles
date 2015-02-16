# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# zsh options
setopt notify
setopt autocd
setopt prompt_subst
unsetopt beep

# key bindings
bindkey -v
bindkey '^r' history-incremental-search-backward
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/romain/.zshrc'

# auto load
autoload -Uz compinit && compinit
autoload -Uz colors && colors

export KEYTIMEOUT=1

# Un peu de couleur
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"

# PATH le chemin
export PATH=/usr/local:/usr/local/bin:$PATH
export EDITOR=vim

# Prompt porn
export PROMPT="%{$fg[green]%}%n:%~%{$reset_color%} %{$fg_bold[white]%}なに?%{$reset_color%} "

alias ls="ls -Gp"
alias ll="ls -lh"
alias lilibox="ssh romain@192.168.0.37"
alias firefox="open /Applications/Firefox.app"
alias vlc="open /Applications/Vlc.app"
alias mutt="cd ~/Desktop && mutt; cd - > /dev/null"
alias ebp="vim ~/.bash_profile"
alias PAD="vim ~/scratchpad.rst"

# Git aliases
alias ga="git add"
alias gs="git status"
alias gl="git log --graph"
alias gi="git init"
alias gc="git commit"
alias gco="git checkout"

alias RUN='python manage.py runserver'

alias cd.="cd .."

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# mm is for make and move as I'm fed up with typing mkdir stuff && cd stuff
mm() {
    mkdir -p $1 && cd $1
}

# Show git branch if it exists
git_show_branch() {
    git symbolic-ref -q HEAD 2> /dev/null | awk 'BEGIN { FS="/" } {  print $3 }' 
}

# Build Right prompt using git information
build_RPS1() {
    local _color
    git diff-index --quiet HEAD 2> /dev/null && _color=green || _color=red
    local git_branch_str=$(git_show_branch)
    [[ x$git_branch_str == x ]] && echo "" || echo "[%{$fg[$_color]%}$git_branch_str%{$reset_color%}]"
}

RPS1='$(build_RPS1)'
