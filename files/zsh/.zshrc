export ZSH="$HOME/.oh-my-zsh"
ZSH_CUSTOM="$HOME/.zsh_custom"
ZSH_THEME="atb"
plugins=(git colored-man colorize pip python brew osx zsh-syntax-highlighting)

source ~/env.sh
source $ZSH/oh-my-zsh.sh
unsetopt inc_append_history
unsetopt share_history
export LANG=en_US.UTF-8
export EDITOR='vim'

PATH="/Users/andrew/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/andrew/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/andrew/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/andrew/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/andrew/perl5"; export PERL_MM_OPT;

fpath=(/usr/local/share/zsh-completions $fpath)
