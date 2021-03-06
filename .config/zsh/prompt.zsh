function __git_prompt() {
  local gitcurrent=`git current 2> /dev/null`
  if [[ -n $gitcurrent ]]; then
    if [[ 'master' = $gitcurrent ]]; then
      echo "(%F{red}$gitcurrent%f)"
    else
      echo "(%F{yellow}$gitcurrent%f)"
    fi
  fi
}

function __directory_prompt() {
  echo $(basename `pwd`)
}

function __machine_info() {
  if [[ $TMUX = '' ]]; then
   echo "%F{cyan}%n%f@%F{magenta}%m%f "
  fi
}

function __env_info() {
  if [[ -n $USER_ENVIRONMENT ]]; then
   echo "%F{red}<$USER_ENVIRONMENT>%f "
  fi
}

local __prompt='[$(__env_info)$(__machine_info)$(__directory_prompt)$(__git_prompt)] $ '

setopt PROMPT_SUBST
export PS1="$__prompt"
