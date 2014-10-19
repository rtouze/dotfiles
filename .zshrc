# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt notify
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/romain/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Config de Romain ^_^
# Vi mode
set -o vi

# Un peu de couleur
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"

# PATH le chemin
export PATH=/usr/local:/usr/local/bin:$PATH
export EDITOR=vim

# Prompt porn
export PROMPT="%n@%m:%~ » "

alias ls="ls -Gp"
alias ll="ls -l"
alias lilibox="ssh romain@192.168.0.37"
alias firefox="open /Applications/Firefox.app"
alias vlc="open /Applications/Vlc.app"
alias mutt="cd ~/Desktop && mutt; cd - > /dev/null"
alias ebp="vim ~/.bash_profile"
alias PAD="vim ~/scratchpad.rst"

# Git aliases
alias ga="git add"
alias gs="git status"
alias gl="git log"
alias gi="git init"
alias gc="git commit"
alias gco="git checkout"

alias RUN='python manage.py runserver'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
