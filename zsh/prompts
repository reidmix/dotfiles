PROMPT_ERROR="✖"
PROMPT_BGJOB="⚙"
PROMPT_DELIM="❯"
PROMPT_CLOUD="☁"
PROMPT_GIT_STAGE="✽"
PROMPT_GIT_TRACK="⦿"
PROMPT_GIT_CHECK="±"
PROMPT_GIT_MERGE="↕"
PROMPT_GIT_PUSH="↑"
PROMPT_GIT_PULL="↓"

get_prompt_whoami() {
  local user=`whoami`
  local host=`echo $HOST:l| cut -d\. -f1`

  if [[ "$user" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    echo "$user@$host"
  fi
}

get_prompt_cloud() {
  if [[ -n "$HEROKU_CLOUD" ]]; then
    echo "$PROMPT_CLOUD $HEROKU_CLOUD"
  fi
}

get_prompt_status() {
  if [[ $? -ne 0 ]]; then
    echo $PROMPT_ERROR
  elif [[ $(jobs -l | wc -l) -gt 0 ]]; then
    echo $PROMPT_BGJOB
  fi
}

get_prompt_nostat() {
  if [[ "$(get_prompt_status)" == "" ]]; then
    echo $PROMPT_DELIM
  fi
}

get_prompt_cwd() {
  echo "%c"
}

parse_git_dirty() {
  local git_status="$(command git status 2>/dev/null)"
  local state;
  local remote;

  if [[ ${git_status} =~ "Your branch and .* have diverged" ]]; then
    remote=$PROMPT_GIT_MERGE
  elif [[ ${git_status} =~ "Your branch is ahead" ]]; then
    remote=$PROMPT_GIT_PUSH
  elif [[ ${git_status} =~ "Your branch is behind" ]]; then
    remote=$PROMPT_GIT_PULL
  fi

  if [[ ${git_status} =~ "Changes to be committed" ]]; then
    state=$PROMPT_GIT_CHECK
  elif [[ ${git_status} =~ "Untracked files" ]]; then
    state=$PROMPT_GIT_TRACK
  elif [[ ${git_status} =~ "Changes not staged for commit" ]]; then
    state=$PROMPT_GIT_STAGE
  fi
  
  if [[ -n $remote || -n $state ]]; then
    echo "$remote$state"
  fi
}

colorize() {
  [[ -n "$1" ]] && local space=" "
  echo "%{$fg_bold[$2]%}$1%{$reset_color%}$space"
}

promptize() {
  echo "$(colorize "$("get_prompt_$1")" $2)"
}

build_git_state() {
  ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0

  local git_state
  git_state="${git_state}$(colorize "$PROMPT_DELIM"       "magenta")"
  git_state="${git_state}$(colorize "${ref#refs/heads/}"  "red")"
  git_state="${git_state}$(colorize "$(parse_git_dirty)"  "yellow")"
  
  echo $git_state
}

build_prompt() {
  local build_prompt
  build_prompt="${build_prompt}$(promptize "cloud"    "blue")"
  build_prompt="${build_prompt}$(promptize "whoami"   "yellow")"
  build_prompt="${build_prompt}$(promptize "status"   "red")"
  build_prompt="${build_prompt}$(promptize "nostat"   "magenta")"
  build_prompt="${build_prompt}$(promptize "cwd"      "cyan")"

  echo "${build_prompt}"
}

PROMPT='$(build_prompt)$(build_git_state)'
