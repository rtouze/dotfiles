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
zstyle :compinstall filename '/home/romain/.zshrc'

# auto load
autoload -Uz compinit && compinit
autoload -Uz colors && colors

export KEYTIMEOUT=1


# PATH le chemin
#export JAVA_HOME=/home/romain/softs/jdk-9
export JAVA_HOME=$HOME/ONGOING/comptoir_des_pharmacies/softs/java/jdk1.8.0_162
export PATH=$HOME/bin:/usr/local/bin:$JAVA_HOME/bin:$PATH
export PATH="$HOME/.yarn/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/softs/node/current/bin:$PATH"
export PATH="$HOME/softs/go/bin:$PATH"

# pip --user needs that
export PATH=$HOME/.local/bin:$PATH

# ruby
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init - zsh)"
export PATH=$HOME/softs/ruby/ruby-build/bin:$PATH

# Haskell
export EDITOR=vim
# export TERM=screen-256color

# FZF tweaking
export FZF_DEFAULT_COMMAND='rg --files --ignore-vcs'

#Prompt porn
export PROMPT="%{$fg[green]%}%n:%~%{$reset_color%} $ "



if type exa>/dev/null 2>&1; then
    alias ls="exa"
    alias ll="exa -l -snew"
else
    alias ls="ls --color"
    alias ll="ls -lh"
fi
alias mutt="neomutt"
alias gmail="mutt"
alias Orange="mutt -F ~/.orange_mutt"
alias zalem="mutt -F ~/.muttzalem"
alias rtodev="mutt -F ~/.muttrtodev"
 
alias PAD="vim ~/scratchpad.rst"
alias fuck='eval $(thefuck $(fc -ln -1 | tail -n 1)); fc -R'
alias v=vim
alias vf='vim `fzf`'
alias LOCK="xscreensaver-command -lock"

# Git aliases
alias ga="git add"
alias gs="git status"
alias gl="git log --graph"
alias gi="git init"
alias gc="git commit"
alias gco="git checkout"
alias gp="git push"

# Py stuff
alias RUN='python manage.py runserver'
alias python=python3  # Python 3 by default!

alias cd.="cd .."

# xrandr

alias EDPOFF="xrandr --output eDP-1 --off"
alias EDPON="xrandr --output eDP-1 --auto"

# tmux aliases
alias tn="tmux new-window"
alias ta="tmux attach"

alias US="setxkbmap us"
alias FR="setxkbmap fr"

# PHP stuff
alias serve='php artisan serve'
alias pam='php artisan migrate'
alias pamr='php artisan migrate:rollback --step=1'
alias cf='composer format'
alias yd='yarn dev'

alias -s rst=vim
alias -s pdf=evince

export ON=~/ONGOING
export IN=~/INBOX
export OU=~/OUTBOX

alias -s rst=vim
alias -s pdf=evince

# Clever cloud
alias sshcc="ssh -t ssh@sshgateway-clevercloud-customers.services.clever-cloud.com"

alias fx=firefox

alias TGL="systemctl suspend && slock"
alias DIE="sudo shutdown -h now"

# clever cloud
alias sshcc="ssh -t ssh@sshgateway-clevercloud-customers.services.clever-cloud.com"

# PHP
alias phpunit="php vendor/bin/phpunit"
alias pu="php vendor/bin/phpunit"


# mm is for make and move as I'm fed up with typing mkdir stuff && cd stuff
mm() {
    mkdir -p $1 && cd $1
}

genpass() {
    gpg --gen-random --armor 1 15
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

FLIP() {
    echo "(╯°□°）╯ ︵ ┻━┻"
}

sshot() {
    sleep 2 && import /tmp/screen.png && xclip -selection clipboard -t image/png < /tmp/screen.png
}

RPS1='$(build_RPS1)'

[ -f ~/.config/pomodoro.sh ] && source ~/.config/pomodoro.sh

if [ -f ~/.config/secret.sh ]; then
    source ~/.config/secret.sh
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH=~/softs/node/current/bin:$PATH

# no capslock !
setxkbmap -option caps:escape
