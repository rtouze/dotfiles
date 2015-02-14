# Config de Romain ^_^
# Vi mode
set -o vi

# Un peu de couleur
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"

# PATH le chemin
export PATH=/usr/local:/usr/local/bin:$PATH
export EDITOR=vim

# Prompt porn
export PS1="\n\u@\h:\w\nなに? "

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
alias gl="git log --graph"
alias gi="git init"
alias gc="git commit"
alias gco="git checkout"

alias RUN='python manage.py runserver'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# for a git branch func to put in prompt
# git branch --no-color | grep \* | cut -d' ' -f2
