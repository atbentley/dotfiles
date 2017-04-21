#!/bin/zsh

# PATH
export PATH="/Users/andrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:$PATH"
export EDITOR='vim'

# Python
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# Ruby
which rbenv &> /dev/null && eval "$(rbenv init -)"

# LaTeX
export PATH="/usr/local/texlive/2016basic/bin/x86_64-darwin:$PATH"

# ENV
export PROJECT_HOME=$HOME/projects
export JAVA_HOME="$(/usr/libexec/java_home)"

hl() {
    less -p $1 $2
}

# ALIASES
alias t="tree -CA -I \".git|env|.env|node_modules|*.pyc\""
alias venv="source env/bin/activate"
alias venvv="source .env/bin/activate"
alias workit="git config user.email \"andrew.bentley@thoughtworks.com\""
alias fpp="fpp -nfc"
alias gomp="netstat -anp tcp"
alias mkenv="virtualenv --python=python3 env"
alias projects="cd ~/projects"
alias sources="cd ~/sources"
alias bugs="cd ~/bugs"
alias down="cd app/config/assets/edp"
alias up="cd ../../../../"
alias qr="qrcode-terminal"
