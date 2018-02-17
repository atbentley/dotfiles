function get_pwd(){
  git_root=$PWD
  levels=0
  while [[ $git_root != / && ! -e $git_root/.git ]]; do
    levels=$(( levels + 1 ))
    git_root=$git_root:h
  done


  if [[ ${levels} -gt 2 ]]; then
    echo "%{$fg_bold[cyan]%}${git_root##*/}/…/${PWD##*/}%{$reset_color%} "
  else
    if [[ $git_root = / ]]; then
      prompt_short_dir=%~
    else
      parent=${git_root%\/*}
      prompt_short_dir=${PWD#$parent/}
    fi
    echo "%{$fg_bold[cyan]%}$prompt_short_dir%{$reset_color%} "
  fi
}

function get_git_commits_ahead() {
  commits_ahead=$(git_commits_ahead 2> /dev/null)
  if [[ ${commits_ahead} -ne 0 ]]; then
    echo "%{$fg_bold[red]%}▴${commits_ahead}"
  fi
}

function get_git_prompt_info() {
  branch="$(git_prompt_info)"
  if [[ ! -z ${branch} ]]; then
    echo "${branch}$(get_git_commits_ahead) "
  fi
}

VIRTUAL_ENV_DISABLE_PROMPT=true
local ret_status="%(?:%{$fg_bold[green]%}∴ :%{$fg_bold[red]%}∴ )"
PROMPT='$(get_pwd)$(parse_git_dirty)$(get_git_prompt_info)${ret_status}%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}"
