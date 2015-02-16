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
zstyle :compinstall filename '/home/RTOUZE/.dotfile/.zshrc'

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

alias ls="ls --color"
alias ll="ls -lh"
alias lilibox="ssh romain@192.168.0.37"
alias firefox="open /Applications/Firefox.app"
alias vlc="open /Applications/Vlc.app"
alias mutt="cd ~/Desktop && mutt; cd - > /dev/null"
alias ebp="vim ~/.bash_profile"
alias PAD="vim ~/scratchpad.rst"
alias grep="grep --color"

# Git aliases
alias ga="git add"
alias gs="git status"
alias gl="git log --graph"
alias gi="git init"
alias gc="git commit"
alias gco="git checkout"
alias svn="LANG=fr_FR.ISO-8859-15 svn"

# Aliases svn
alias ss="svn status"
alias sl="svn log"
alias sc="svn commit"
alias sa="svn add"
alias sr="svn revert"
alias su="svn update"

alias RUN='python manage.py runserver'

alias cd.="cd .."

# Alias sympas - endroits work
alias PERSO='cd /cygdrive/d/Users/RTOUZE/Documents/perso'
alias HERE="explorer `cygpath -w .`"
alias CODE="cd /cygdrive/d/Workspace/"
alias GTD='vim /cygdrive/d/Users/RTOUZE/Documents/GTD/GTD.rst'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# export for work
# Ajustements du PATH
export PATH=$PATH:/usr/sbin
export PATH=$PATH:/cygdrive/c/Program\ Files/7-Zip
export PATH=$PATH:/cygdrive/c/Program\ Files\ \(x86\)/Mozilla\ Firefox
export ITCE=/cygdrive/d/Users/RTOUZE/Documents/Projets/ITCE

# mm is for make and move as I'm fed up with typing mkdir stuff && cd stuff
mm() {
    mkdir -p $1 && cd $1
}

# Show git branch if it exists
# git_show_branch() {
#     git symbolic-ref -q HEAD 2> /dev/null | awk 'BEGIN { FS="/" } {  print $3 }' 
# }

# Build Right prompt using git information
# build_RPS1() {
#     local _color
#     git diff-index --quiet HEAD 2> /dev/null && _color=green || _color=red
#     local git_branch_str=$(git_show_branch)
#     [[ x$git_branch_str == x ]] && echo "" || echo "[%{$fg[$_color]%}$git_branch_str%{$reset_color%}]"
# }

#RPS1='$(build_RPS1)'
