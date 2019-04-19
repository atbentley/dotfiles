#!/usr/bin/env zsh

get_dir() {
  git_root=$PWD
  levels=0
  while [[ $git_root != / && ! -e $git_root/.git ]]; do
    levels=$(( levels + 1 ))
    git_root=$git_root:h
  done

  if [[ ${levels} -gt 2 ]]; then
    echo "${git_root##*/}/…/${PWD##*/}%{$reset_color%} "
  else
    if [[ $git_root = / ]]; then
      prompt_short_dir=%~
    else
      parent=${git_root%\/*}
      prompt_short_dir=${PWD#$parent/}
    fi
    echo "$prompt_short_dir%{$reset_color%}"
  fi
}

get_git_commits_ahead() {
  commits_ahead=$(git_commits_ahead 2> /dev/null)
  if [[ ${commits_ahead} -ne 0 ]]; then
    echo "%{$fg_bold[red]%}▴${commits_ahead}"
  fi
}

get_dir_colour() {
  if ! [[ -z $(parse_git_dirty) ]]; then
    echo "%{$fg_bold[magenta]%}"
  else
    echo "%{$fg_bold[cyan]%}"
  fi
}

VIRTUAL_ENV_DISABLE_PROMPT=true
local ret_status=" %(?:%{$fg_bold[green]%}€ :%{$fg_bold[red]%}¢ )"
PROMPT='$(get_dir_colour)$(get_dir)$(get_git_commits_ahead)${ret_status}%{$reset_color%}'
