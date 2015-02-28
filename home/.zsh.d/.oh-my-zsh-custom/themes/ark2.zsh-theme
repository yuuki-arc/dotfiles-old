VIRTUAL_ENV_DISABLE_PROMPT=true
YUUKIARC_NVM_SHOW=true

# PROMPT
YUUKIARC_PROMPT_CHAR="\$"

# STATUS
YUUKIARC_STATUS_BG=green
YUUKIARC_STATUS_ERROR_BG=red
YUUKIARC_STATUS_FG=white

# TIME
YUUKIARC_TIME_BG=white
YUUKIARC_TIME_FG=black

# VIRTUALENV
YUUKIARC_VIRTUALENV_BG=yellow
YUUKIARC_VIRTUALENV_FG=white
YUUKIARC_VIRTUALENV_PREFIX=🐍

# NVM
YUUKIARC_NVM_BG=green
YUUKIARC_NVM_FG=white
YUUKIARC_NVM_PREFIX="⬡ "

# RMV
YUUKIARC_RVM_BG=magenta
YUUKIARC_RVM_FG=white
YUUKIARC_RVM_PREFIX=♦️

# DIR
YUUKIARC_DIR_BG=blue
YUUKIARC_DIR_FG=white

# GIT
YUUKIARC_GIT_BG=white
YUUKIARC_GIT_FG=black

# CONTEXT
YUUKIARC_CONTEXT_BG=black
YUUKIARC_CONTEXT_FG=default

# GIT PROMPT
ZSH_THEME_GIT_PROMPT_PREFIX=" \ue0a0 "
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=" ✘"
ZSH_THEME_GIT_PROMPT_CLEAN=" ✔"
ZSH_THEME_GIT_PROMPT_ADDED=" %F{green}✚%F{black}"
ZSH_THEME_GIT_PROMPT_MODIFIED=" %F{blue}✹%F{black}"
ZSH_THEME_GIT_PROMPT_DELETED=" %F{red}✖%F{black}"
ZSH_THEME_GIT_PROMPT_UNTRACKED=" %F{yellow}✭%F{black}"
ZSH_THEME_GIT_PROMPT_RENAMED=" ➜"
ZSH_THEME_GIT_PROMPT_UNMERGED=" ═"
ZSH_THEME_GIT_PROMPT_AHEAD=" ⬆"
ZSH_THEME_GIT_PROMPT_BEHIND=" ⬇"
ZSH_THEME_GIT_PROMPT_DIVERGED=" ⬍"
ZSH_THEME_GIT_PROMPT_SHA_BEFORE=" <"
ZSH_THEME_GIT_PROMPT_SHA_AFTER=">"


autoload vcs_info
zstyle ":vcs_info:*" enable git
zstyle ":vcs_info:git:*" check-for-changes true
zstyle ":vcs_info:git:*" formats "⭠ %r ⮁ %b%u%c"
zstyle ":vcs_info:git:*" actionformats "⭠ %r ⮁ %b%u%c ⮁ %a"
zstyle ":vcs_info:git:*" unstagedstr " ⮁ Unstaged"
zstyle ":vcs_info:git:*" stagedstr " ⮁ Staged"

git_is_track_branch(){
    if [ "$(git remote 2>/dev/null)" != "" ]; then
        local target_tracking_branch="origin/$(git rev-parse --abbrev-ref HEAD)"
        for tracking_branch in $(git branch -ar) ; do
            if [ "$target_tracking_branch" = "$tracking_branch" ]; then
                echo "true"
            fi
        done
    fi
}

git_info_pull(){
    if [ -n "$(git_is_track_branch)" ]; then
        local current_branch="$(git rev-parse --abbrev-ref HEAD)"
        local head_rev="$(git rev-parse HEAD)"
        local origin_rev="$(git rev-parse origin/$current_branch)"
        if [ "$head_rev" != "$origin_rev" ] && [ "$(git_info_push)" = "" ]; then
                echo " ⮁ Can Be Pulled"
        fi
    fi
}

git_info_push(){
    if [ -n "$(git_is_track_branch)" ]; then
        local current_branch="$(git rev-parse --abbrev-ref HEAD)"
        local push_count=$(git rev-list origin/"$current_branch".."$current_branch" 2>/dev/null | wc -l)
        if [ "$push_count" -gt 0 ]; then
            echo " ⮁ Can Be Pushed($push_count)"
        fi
    fi
}

function update_git_info() {
    LANG=en_US.UTF-8 vcs_info
    _vcs_info=$vcs_info_msg_0_
    _git_info_push=$(git_info_push)
    _git_info_pull=$(git_info_pull)
    if [ -n "$_vcs_info" ]; then
        local BG_COLOR=green

        if [ -n "$_git_info_push" ] || [ -n "$_git_info_pull" ]; then
          BG_COLOR=yellow
          FG_COLOR=black
        fi

        if [[ -n `echo $_vcs_info | grep -Ei "merge|unstaged|staged" 2> /dev/null` ]]; then
            BG_COLOR=red
            FG_COLOR=white
        fi
        echo "%{%K{$BG_COLOR}%}⮀%{%F{$FG_COLOR}%} $_vcs_info$_git_info_push$_git_info_pull %{%F{$BG_COLOR}%K{magenta}%}⮀"
    else
       echo "%{%K{magenta}%}⮀"
    fi
}

CURRENT_BG='NONE'
SEGMENT_SEPARATOR=''

# Begin a segment
# Takes two arguments, background and foreground. Both can be omitted,
# rendering default background/foreground.
prompt_segment() {
  local bg fg
  [[ -n $1 ]] && bg="%K{$1}" || bg="%k"
  [[ -n $2 ]] && fg="%F{$2}" || fg="%f"
  if [[ $CURRENT_BG != 'NONE' && $1 != $CURRENT_BG ]]; then
    echo -n " %{$bg%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR%{$fg%} "
  else
    echo -n "%{$bg%}%{$fg%} "
  fi
  CURRENT_BG=$1
  [[ -n $3 ]] && echo -n $3
}

# End the prompt, closing any open segments
prompt_end() {
  if [[ -n $CURRENT_BG ]]; then
    echo -n " %{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR"
  else
    echo -n "%{%k%}"
  fi
  echo -n "%{%f%}"
  CURRENT_BG=''
}

# ------------------------------------------------------------------------------
# PROMPT COMPONENTS
# Each component will draw itself, and hide itself if no information needs
# to be shown
# ------------------------------------------------------------------------------

# Context: user@hostname (who am I and where am I)
context() {
  local user="$(whoami)"
  [[ "$user" != "$YUUKIARC_CONTEXT_DEFAULT_USER" || -n "$YUUKIARC_IS_SSH_CLIENT" ]] && echo -n "${user}@%m"
}
prompt_context() {
  local user="$(whoami)"
  # echo -n "${user}@%m %K %n "
  prompt_segment $YUUKIARC_CONTEXT_BG $YUUKIARC_CONTEXT_FG "${user}@%m %K %n "
  # prompt_segment '%{%b%F{gray}%K{blue}%} %(?.%{%F{green}%}✔.%{%F{red}%}✘)%{%F{black}%} %n %{%F{blue}%}'

  # local _context="$(context)"
  # [[ -n "$_context" ]] && prompt_segment $YUUKIARC_CONTEXT_BG $YUUKIARC_CONTEXT_FG "$_context"
}

# Git
prompt_git() {
  local ref dirty mode repo_path
  repo_path=$(git rev-parse --git-dir 2>/dev/null)

  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    prompt_segment $YUUKIARC_GIT_BG $YUUKIARC_GIT_FG
    echo -n "$(current_branch)$(git_prompt_short_sha)$(git_prompt_status)"
  fi
}

# Dir: current working directory
prompt_dir() {
  local dir=''
  local _context="$(context)"
  # dir="${dir}%4c" || dir="${dir}%1~"
  dir="${dir}%~"
  prompt_segment $YUUKIARC_DIR_BG $YUUKIARC_DIR_FG $dir
}

# RVM: only shows RVM info if on a gemset that is not the default one
prompt_rvm() {
  if which rvm-prompt &> /dev/null; then
    if [[ ! -n $(rvm gemset list | grep "=> (default)") ]]
      then
      prompt_segment $YUUKIARC_RVM_BG $YUUKIARC_RVM_FG $YUUKIARC_RVM_PREFIX"  $(rvm-prompt i v g)"
    fi
  fi
}

# Virtualenv: current working virtualenv
prompt_virtualenv() {
  local virtualenv_path="$VIRTUAL_ENV"
  if [[ -n $virtualenv_path && -n $VIRTUAL_ENV_DISABLE_PROMPT ]]; then
    prompt_segment $YUUKIARC_VIRTUALENV_BG $YUUKIARC_VIRTUALENV_FG $YUUKIARC_VIRTUALENV_PREFIX"  $(basename $virtualenv_path)"
  fi
}

# NVM: Node version manager
prompt_nvm() {
  [[ $(which nvm) != "nvm not found" ]] || return
  local nvm_prompt
  nvm_prompt=$(node -v 2>/dev/null)
  [[ "${nvm_prompt}x" == "x" ]] && return
  nvm_prompt=${nvm_prompt:1}
  prompt_segment $YUUKIARC_NVM_BG $YUUKIARC_NVM_FG $YUUKIARC_NVM_PREFIX$nvm_prompt
}

prompt_time() {
  prompt_segment $YUUKIARC_TIME_BG $YUUKIARC_TIME_FG %D{%H:%M:%S}
}

prompt_rbenv() {
  if  [ -f "$PWD/.ruby-version" ] ; then
    if [ -e ~/.rvm/bin/rvm-prompt ]; then
      RUBY_VERSION_PROMPT="%{$fg[red]%}‹$(~/.rvm/bin/rvm-prompt i v)› %{$reset_color%}"
    else
      if which rbenv &> /dev/null; then
        RUBY_VERSION_PROMPT="%{$fg[red]%}‹$(rbenv version | sed -e "s/ (set.*$//")› %{$reset_color%}"
      fi
    fi
  fi
  prompt_segment $YUUKIARC_TIME_BG $YUUKIARC_TIME_FG $RUBY_VERSION_PROMPT
}


# Status:
# - was there an error
# - am I root
# - are there background jobs?
prompt_status() {
  local symbols
  symbols=()
  [[ $RETVAL -ne 0 ]] && symbols+="✘"
  [[ $UID -eq 0 ]] && symbols+="%{%F{yellow}%}⚡%f"
  [[ $(jobs -l | wc -l) -gt 0 ]] && symbols+="⚙"

  if [[ -n "$symbols" && $RETVAL -ne 0 ]] then
    prompt_segment $YUUKIARC_STATUS_ERROR_BG $YUUKIARC_STATUS_FG "$symbols"
  elif [[ -n "$symbols" ]] then
    prompt_segment $YUUKIARC_STATUS_BG $YUUKIARC_STATUS_FG "$symbols"
  fi

}

# Prompt Character
prompt_char() {
  local bt_prompt_char
  bt_prompt_char="$YUUKIARC_PROMPT_CHAR"
  bt_prompt_char="%(!.%F{red}#.%F{green}${bt_prompt_char}%f)"
  echo -n $bt_prompt_char
}

# ------------------------------------------------------------------------------
# MAIN
# Entry point
# ------------------------------------------------------------------------------

build_prompt() {
  RETVAL=$?
  prompt_time
  prompt_status
  prompt_rbenv
  prompt_virtualenv
  prompt_nvm
  prompt_context
  prompt_dir
  prompt_git
  # prompt_hg
  prompt_end
}

PROMPT='
%{%f%b%k%}$(build_prompt)
%{${fg_bold[default]}%}$(prompt_char) %{$reset_color%}'


# PROMPT_DIR='%{%F{black}%} %~%  '
# PROMPT_SU='%(!.%{%k%F{blue}%K{black}%}⮀%{%F{yellow}%} ⚡ %{%k%F{black}%}.%{%k%F{magenta}%})⮀%{%f%k%b%}'
# PROMPT='
# %{%f%b%k%}$PROMPT_HOST$(update_git_info)$PROMPT_DIR$PROMPT_SU
# %{${fg_bold[default]}%}$(prompt_char) %{$reset_color%}'
# SPROMPT='${WHITE}%r is correct? [n,y,a,e]: %{$reset_color%}'
