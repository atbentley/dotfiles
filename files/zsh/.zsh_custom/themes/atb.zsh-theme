function get_pwd(){
  git_root=$PWD
  while [[ $git_root != / && ! -e $git_root/.git ]]; do
    git_root=$git_root:h
  done
  if [[ $git_root = / ]]; then
    unset git_root
    prompt_short_dir=%~
  else
    parent=${git_root%\/*}
    prompt_short_dir=${PWD#$parent/}
  fi
  echo "%{$fg[cyan]%}$prompt_short_dir%{$reset_color%} "
}

function get_venv() {
  if test ! -z $VIRTUAL_ENV; then
    parent=${VIRTUAL_ENV%/*}
    if [ "${PWD##$parent}" != "$PWD" ]; then
      color="%{$fg_bold[green]%}"
    else
      color="%{$fg_bold[red]%}"
    fi
    ref=$(basename $VIRTUAL_ENV) || return
    echo "${color}${ref} "
  fi
}

function get_git_work_or_personal() {
  if ls -a . | grep '^.git$' &> /dev/null; then
    if git config user.email | grep 'gmail.com' &> /dev/null; then
      echo "🍺 "
    else
      echo "💻 "
    fi
  fi
}

function get_git_commits_ahead() {
  commits_ahead=$(git_commits_ahead 2> /dev/null)
  if [[ ${commits_ahead} -ne 0 ]]; then
    echo "%{$fg_bold[red]%}▴${commits_ahead}"
  fi
}

function get_git_prompt_info() {
  echo "$(get_git_work_or_personal)$(git_prompt_info)$(get_git_commits_ahead)"
}

VIRTUAL_ENV_DISABLE_PROMPT=true
local ret_status="%(?:%{$fg_bold[green]%}➜  :%{$fg_bold[red]%}➜  )"
PROMPT='${ret_status}$(get_pwd)$(get_venv)$(parse_git_dirty)$(get_git_prompt_info)%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}"
