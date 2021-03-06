#!/bin/zsh

export PATH="/Users/andrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:$PATH"
export EDITOR='vim'
export PROJECT_HOME=$HOME/projects

# Python
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
export PIPENV_VENV_IN_PROJECT="true"

# Ruby
which rbenv &> /dev/null && eval "$(rbenv init -)"

# Go
export PATH="/Users/andrew/go/bin:$PATH"

# LaTeX
export PATH="/usr/local/texlive/2016basic/bin/x86_64-darwin:$PATH"

# Java
eval "$(jenv init -)"

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Node
export PATH="$HOME/.nenv/bin:$PATH"
eval "$(nenv init -)"

# z
source /usr/local/etc/profile.d/z.sh
alias j=z

# yubikey
export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

hl() {
  less -p $1 $2
}

code () {
  VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $*
}

# Aliases
alias t="tree -CA -I \".git|env|.env|node_modules|*.pyc\""
alias venv="source env/bin/activate"
alias venvv="source .env/bin/activate"
alias fpp="fpp -nfc"
alias mkenv="virtualenv --python=python3 env"
alias f="find . -name"
alias week="date +%V"
