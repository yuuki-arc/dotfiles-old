# # Color shortcuts
# R=$fg[red]
# G=$fg[green]
# M=$fg[magenta]
# RB=$fg_bold[red]
# YB=$fg_bold[yellow]
# BB=$fg_bold[blue]
#
# if [ "$(whoami)" = "root" ]; then
#     PROMPTCOLOR="%{$RB%}" PREFIX="-!-";
# else
#     PROMPTCOLOR="" PREFIX="---";
# fi
#
# local return_code="%(?..%{$RB%}%? ↵%{$reset_color%})"
#
# ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}±(%{$fg_bold[yellow]%}"
# ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg_bold[blue]%})%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%}⚡%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg_bold[yellow]%}↑%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}✓%{$reset_color%}"
#
# ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%} ✚"
# ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%} ✹"
# ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✖"
# ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%} ➜"
# ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%} ═"
# ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%} ✭"
#
# MODE_INDICATOR="--NORMAL--"
#
# PROMPT='[%{$fg_bold[green]%}%~%{$fg_no_bold[white]%}]%{$fg_bold[red]%}➜$(git_prompt_info)%{$reset_color%}$(git_prompt_status)%{$reset_color%} $ '
# RPROMPT='$(vi_mode_prompt_info)${return_code}[%{$fg_no_bold[yellow]%}%h%{$reset_color%}][%*]'












##############################################################################

# # derived from minimal.zsh-themme
# # put this file in .oh-my-zsh/custom/
#
# # got visualization of "git stash" from
# # https://github.com/yoshiori/oh-my-zsh-yoshiori/blob/master/yoshiori.zsh-theme
#
# # add visualization of rebase
#
# # import $(git_prompt_status) from lib/git.zsh
#
# ZSH_THEME_GIT_PROMPT_PREFIX="["
# ZSH_THEME_GIT_PROMPT_SUFFIX="]"
# ZSH_THEME_GIT_PROMPT_DIRTY="*"
# ZSH_THEME_GIT_PROMPT_CLEAN=""
# ZSH_THEME_GIT_PROMPT_STASH_COUNT_BEFORE="#stash="
# ZSH_THEME_GIT_PROMPT_STASH_COUNT_AFTER=""
# ZSH_THEME_GIT_PROMPT_UNTRACKED="*untracked"
# ZSH_THEME_GIT_PROMPT_UNMERGED="*unmerged"
# ZSH_THEME_GIT_PROMPT_DELETED="*deleted"
# ZSH_THEME_GIT_PROMPT_RENAMED="*renamed"
# ZSH_THEME_GIT_PROMPT_MODIFIED="*modified"
# ZSH_THEME_GIT_PROMPT_ADDED="*added"
# ZSH_THEME_GIT_PROMPT_REBASING="*rebasing"
#
# # called to show git's state on prompt
# # original (minimal.zsh) impl. used $(current_branch) as a switch,
# # so it doesn't work when detached head
# git_custom_status() {
#   local head=$(git_get_head)
#   if [ -n "$head" ]; then
#     echo -n "$ZSH_THEME_GIT_PROMPT_PREFIX"
#     echo -n "$(parse_git_dirty)$head"
#     echo -n "$(git_is_rebasing)$(git_prompt_stash_count)"
#     echo -n "$(git_prompt_status)"
#     echo -n "$ZSH_THEME_GIT_PROMPT_SUFFIX"
#   fi
# }
#
# # git head
# # when in git repos, returns symbolic-ref or short hash, otherwise empty string
# function git_get_head(){
#   local cb=$(current_branch) # current_branch is in git.plugin.zsh
#   if [ -n "$cb" ]; then # if current_branch non-zero
#     echo $cb
#     return
#   fi
#   local head=$(git reflog 2>/dev/null | head -n 1 | cut -c 1-7)
#   echo "$head"
# }
#
# function git_is_rebasing(){
#   local rb=$(_git_is_rebasing)
#   if [ "$rb" = "rebasing" ]; then
#     echo "$ZSH_THEME_GIT_PROMPT_REBASING"
#   fi
# }
#
# function git_is_rebasing() {
#     local topdir=$(git rev-parse --show-toplevel 2>/dev/null)
#     if [ $? -eq 0 ]; then
#         if [ -d $topdir/.git/rebase-merge ]; then
#             echo "$ZSH_THEME_GIT_PROMPT_REBASING"
#         fi
#     fi
# }
#
# # git stash count
# function git_prompt_stash_count(){
#   COUNT=$(git stash list 2>/dev/null | wc -l | tr -d ' ')
#   if [ "$COUNT" -gt 0 ]; then
#     echo "$ZSH_THEME_GIT_PROMPT_STASH_COUNT_BEFORE$COUNT$ZSH_THEME_GIT_PROMPT_STASH_COUNT_AFTER"
#   fi
# }
#
#
# PROMPT='%1~$(git_custom_status)$%b '
#








##############################################################################


# # this theme depends on git plugin.
#
# function color() {
#     echo "%{$fg[$1]%}$2%{$reset_color%}"
# }
# function color_bold() {
#     echo "%{$fg_bold[$1]%}$2%{$reset_color%}"
# }
#
# ZSH_THEME_GIT_PROMPT_ADDED=$(color cyan '+')
# ZSH_THEME_GIT_PROMPT_MODIFIED=$(color yellow '*')
# ZSH_THEME_GIT_PROMPT_DELETED=$(color red 'x')
# ZSH_THEME_GIT_PROMPT_RENAMED=$(color blue 'o')
# ZSH_THEME_GIT_PROMPT_UNMERGED=$(color magenta '!')
# ZSH_THEME_GIT_PROMPT_UNTRACKED=$(color white '?')
#
# function my_git_status() {
# #    [ $(current_branch) ] && echo "($(current_branch)$(git_prompt_status)) <$(git_time_since_commit)$(check_git_prompt_info)
# #>"
#     [ $(current_branch) ] && echo "$(git_prompt_short_sha)|$(check_git_prompt_info)$(git_prompt_status)$(git_remote_status)"
# #  echo "$(current_branch)$(git_prompt_short_sha)$(git_prompt_status)"
# }
#
# # Git sometimes goes into a detached head state. git_prompt_info doesn't
# # return anything in this case. So wrap it in another function and check
# # for an empty string.
# function check_git_prompt_info() {
#     if git rev-parse --git-dir > /dev/null 2>&1; then
#         if [[ -z $(git_prompt_info) ]]; then
#             echo "%{$fg[magenta]%}detached-head%{$reset_color%})"
#         else
#             echo "$(git_prompt_info)"
#         fi
#     fi
# }
#
# # Format for git_prompt_long_sha() and git_prompt_short_sha()
# ZSH_THEME_GIT_PROMPT_SHA_BEFORE=" <"
# ZSH_THEME_GIT_PROMPT_SHA_AFTER=">"
#
# # Prompt format
# PROMPT='
# %{$GREEN_BOLD%}%n@%m%{$WHITE%}:%{$YELLOW%}%~%u$(parse_git_dirty)$(git_prompt_ahead)%{$RESET_COLOR%}
# %{$BLUE%}>%{$RESET_COLOR%} '
# RPROMPT='%{$GREEN_BOLD%}$(current_branch)$(git_prompt_short_sha)$(git_prompt_status)%{$RESET_COLOR%}'
#
#
# DATE_TIME=$(color yellow '[%D{%Y-%m-%d %K:%M:%S}]')
# HOST_USER_NAME=$(color cyan '%n')$(color_bold 'cyan' '@')$(color cyan '%m')
# CURRENT_DIRECTORY=$(color green '[%~]')
# PROMPT_CHAR=$(color white '$ ')
# PROMPT='${DATE_TIME} ${HOST_USER_NAME}: ${CURRENT_DIRECTORY} $(my_git_status)
# $PROMPT_CHAR'
# PROMPT2=$(color white '> ')

##############################################################################

#function color() {
#    echo "%{$fg[$1]%}$2%{$reset_color%}"
#}
#
#ZSH_THEME_GIT_PROMPT_ADDED=$(color cyan '+')
#ZSH_THEME_GIT_PROMPT_MODIFIED=$(color yellow '*')
#ZSH_THEME_GIT_PROMPT_DELETED=$(color red 'x')
#ZSH_THEME_GIT_PROMPT_RENAMED=$(color blue 'o')
#ZSH_THEME_GIT_PROMPT_UNMERGED=$(color magenta '!')
#ZSH_THEME_GIT_PROMPT_UNTRACKED=$(color white '?')
#
#function my_git_status() {
#    [ $(current_branch) ] && echo "($(current_branch)$(git_prompt_status))"
#}
#
#DATE_TIME=$(color yellow '%D{%Y-%m-%d %K:%M:%S}')
#USER_NAME=$(color red '%n')
#HOST_NAME=$(color cyan '%m')
#CURRENT_DIRECTORY=$(color green '%~')
#PROMPT_CHAR=$(color white '$ ')
#PROMPT='${DATE_TIME}[${USER_NAME}@${HOST_NAME}:${CURRENT_DIRECTORY}]$(my_git_status)
#$PROMPT_CHAR'
#PROMPT2=$(color white '> ')

##############################################################################


#function str_with_color() {
#    echo "%{$fg[$1]%}$2%{$reset_color%}"
#}
#
#ZSH_THEME_GIT_PROMPT_ADDED=$(str_with_color cyan '+')
#ZSH_THEME_GIT_PROMPT_MODIFIED=$(str_with_color yellow '*')
#ZSH_THEME_GIT_PROMPT_DELETED=$(str_with_color red 'x')
#ZSH_THEME_GIT_PROMPT_RENAMED=$(str_with_color blue 'o')
#ZSH_THEME_GIT_PROMPT_UNMERGED=$(str_with_color magenta '!')
#ZSH_THEME_GIT_PROMPT_UNTRACKED=$(str_with_color white '?')
#
#function my_git_status() {
#    [ $(current_branch) ] && echo "($(current_branch)$(git_prompt_status))"
#}
#
#DATE_TIME=$(str_with_color yellow '%D{%Y-%m-%d %K:%M}')
#PROMPT_PREFIX=$(str_with_color white '#')
#SEPARATOR1=$(str_with_color white '|')
#USER_NAME=$(str_with_color blue '%n')
#SEPARATOR2=$(str_with_color white '@')
#HOST_NAME=$(str_with_color cyan '%m')
#SEPARATOR3=$(str_with_color white ':')
#CURRENT_DIRECTORY=$(str_with_color green '%~')
#PROMPT_CHAR=$(str_with_color white '$ ')
#PROMPT='${PROMPT_PREFIX}${DATE_TIME}${SEPARATOR1}${USER_NAME}${SEPARATOR2}${HOST_NAME}${SEPARATOR3}${CURRENT_DIRECTORY} $(my_git_status)
#$PROMPT_CHAR'
#PROMPT2=$(str_with_color white '> ')

##############################################################################


## ZSH Theme - Preview: http://gyazo.com/8becc8a7ed5ab54a0262a470555c3eed.png
#local user_host='%{$terminfo[bold]$fg[green]%}%n@%m%{$reset_color%}'
#local current_dir='%{$terminfo[bold]$fg[blue]%} %~%{$reset_color%}'
#local git_branch='$(git_prompt_info)%{$reset_color%}'
#
#PROMPT="
#${user_host} ${current_dir} ${git_branch}
#ᐅ "
#
#ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}‹"
#ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"
#ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}!%{$reset_color%}%{$fg[yellow]%}"
#
#RPROMPT='$(git_prompt_status)'
#
#ZSH_THEME_GIT_PROMPT_ADDED=" ✚"
#ZSH_THEME_GIT_PROMPT_MODIFIED=" ✹"
#ZSH_THEME_GIT_PROMPT_DELETED=" ✖"
#ZSH_THEME_GIT_PROMPT_RENAMED=" ➜"
#ZSH_THEME_GIT_PROMPT_UNMERGED=" ═"
#ZSH_THEME_GIT_PROMPT_UNTRACKED=" ✭"

##############################################################################

## RVM settings
#if [[ -s ~/.rvm/scripts/rvm ]] ; then
#  RPS1="%{$fg[yellow]%}rvm:%{$reset_color%}%{$fg[red]%}\$(~/.rvm/bin/rvm-prompt)%{$reset_color%} $EPS1"
#else
#  if which rbenv &> /dev/null; then
#    RPS1="%{$fg[yellow]%}rbenv:%{$reset_color%}%{$fg[red]%}\$(rbenv version | sed -e 's/ (set.*$//')%{$reset_color%} $EPS1"
#  fi
#fi
#
#ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[green]%}["
#ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
#ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*%{$reset_color%}"
#ZSH_THEME_GIT_PROMPT_CLEAN=""
#
## Customized git status, oh-my-zsh currently does not allow render dirty status before branch
#git_custom_status() {
#  local cb=$(current_branch)
#  if [ -n "$cb" ]; then
#    echo "$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
#  fi
#}
#
#PROMPT='$(git_custom_status)%{$fg[cyan]%}[%~% ]%{$reset_color%}%B$%b '


##############################################################################

# http://qiita.com/mollifier/items/8d5a627d773758dd8078
# zsh の vcs_info に独自の処理を追加して stash 数とか push していない件数とか何でも表示する

## Default shell configuration
#
# set prompt
#

#＠＠＠プロンプト左側の部分
case ${UID} in
0)
   PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') %B%{${fg[red]}%}%/#%{${reset_color}%}%b "
   PROMPT2="%B%{${fg[red]}%}%_#%{${reset_color}%}%b "
   SPROMPT="%B%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
   ;;
*)
   PROMPT="%{${fg[red]}%}%/%%%{${reset_color}%} "
   PROMPT2="%{${fg[red]}%}%_%%%{${reset_color}%} "
   SPROMPT="%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
   [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
       PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') ${PROMPT}"
   ;;
esac

#
# Show branch name in Zsh's right prompt
#

# vcs_info 設定

RPROMPT=""

autoload -Uz vcs_info
autoload -Uz add-zsh-hook
autoload -Uz is-at-least
autoload -Uz colors

#＠＠＠プロンプト右側部分
# 以下の3つのメッセージをエクスポートする
#   $vcs_info_msg_0_ : 通常メッセージ用 (緑)
#   $vcs_info_msg_1_ : 警告メッセージ用 (黄色)
#   $vcs_info_msg_2_ : エラーメッセージ用 (赤)
zstyle ':vcs_info:*' max-exports 3

zstyle ':vcs_info:*' enable git svn hg bzr
# 標準のフォーマット(git 以外で使用)
# misc(%m) は通常は空文字列に置き換えられる
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b]' '%m' '<!%a>'
zstyle ':vcs_info:(svn|bzr):*' branchformat '%b:r%r'
zstyle ':vcs_info:bzr:*' use-simple true


if is-at-least 4.3.10; then
    # git 用のフォーマット
    # git のときはステージしているかどうかを表示
   zstyle ':vcs_info:(git|git-svn):*' formats '(%s)-[%b]' '%c%u %m %S/%r'
   zstyle ':vcs_info:(git|git-svn):*' actionformats '(%s)-[%b]' '%c%u %m' '<!%a> %S/%r'
   zstyle ':vcs_info:(git|git-svn):*' check-for-changes true
   zstyle ':vcs_info:(git|git-svn):*' stagedstr "+"    # %c で表示する文字列
   zstyle ':vcs_info:(git|git-svn):*' unstagedstr "-"  # %u で表示する文字列
fi

# hooks 設定
if is-at-least 4.3.11; then
    # git のときはフック関数を設定する

    # formats '(%s)-[%b]' '%c%u %m' , actionformats '(%s)-[%b]' '%c%u %m' '<!%a>'
    # のメッセージを設定する直前のフック関数
    # 今回の設定の場合はformat の時は2つ, actionformats の時は3つメッセージがあるので
    # 各関数が最大3回呼び出される。
   zstyle ':vcs_info:(git|git-svn)+set-message:*' hooks \
                                           git-hook-begin \
                                           git-untracked \
                                           git-push-status \
                                           git-nomerge-branch \
					    git-nomerge-master \
                                           git-stash-count

    # フックの最初の関数
    # git の作業コピーのあるディレクトリのみフック関数を呼び出すようにする
    # (.git ディレクトリ内にいるときは呼び出さない)
    # .git ディレクトリ内では git status --porcelain などがエラーになるため
    function +vi-git-hook-begin() {
        if [[ $(command git rev-parse --is-inside-work-tree 2> /dev/null) != 'true' ]]; then
            # 0以外を返すとそれ以降のフック関数は呼び出されない
            return 1
        fi

        return 0
    }

    # untracked ファイル表示
    #
    # untracked ファイル(バージョン管理されていないファイル)がある場合は
    # unstaged (%u) に ? を表示
    function +vi-git-untracked() {
        # zstyle formats, actionformats の2番目のメッセージのみ対象にする
        if [[ "$1" != "1" ]]; then
            return 0
        fi

        if command git status --porcelain 2> /dev/null \
            | awk '{print $1}' \
            | command grep -F '??' > /dev/null 2>&1 ; then

            # unstaged (%u) に追加
            hook_com[unstaged]+='?'
        fi
    }

    # push していないコミットの件数表示
    #
    # リモートリポジトリに push していないコミットの件数を
    # pN という形式で misc (%m) に表示する
    function +vi-git-push-status() {
        # zstyle formats, actionformats の2番目のメッセージのみ対象にする
        if [[ "$1" != "1" ]]; then
            return 0
        fi

        if [[ "${hook_com[branch]}" != "master" ]]; then
            # master ブランチでない場合は何もしない
            return 0
        fi

        # push していないコミット数を取得する
        local ahead
        ahead=$(command git rev-list origin/master..master 2>/dev/null \
            | wc -l \
            | tr -d ' ')

        if [[ "$ahead" -gt 0 ]]; then
            # misc (%m) に追加
            hook_com[misc]+="(p${ahead})"
        fi
    }

    # マージしていない件数表示
    #
    # master 以外のブランチにいる場合に、
    # 現在のブランチ上でまだ master にマージしていないコミットの件数を
    # (mN) という形式で misc (%m) に表示
    function +vi-git-nomerge-branch() {
        # zstyle formats, actionformats の2番目のメッセージのみ対象にする
        if [[ "$1" != "1" ]]; then
            return 0
        fi

        if [[ "${hook_com[branch]}" == "master" ]]; then
            # master ブランチの場合は何もしない
            return 0
        fi

        local nomerged
        nomerged=$(command git rev-list master..${hook_com[branch]} 2>/dev/null | wc -l | tr -d ' ')

        if [[ "$nomerged" -gt 0 ]] ; then
            # misc (%m) に追加
            hook_com[misc]+="(m${nomerged})"
        fi
    }

    # とりあえず実装
    function +vi-git-nomerge-master() {
        # vcs_info_msg_1_ を設定する場合のみ処理の対象とする
        if [[ "$1" != "1" ]]; then
            return 0
        fi

        # master ブランチにいる時はなにもしない
        if [[ "${hook_com[branch]}" == "master" ]]; then
            return 0
        fi

        # 現在のブランチにまだマージしていないブランチ一覧を取得する。
        # その中に master が含まれていた場合、 master は現在のブランチにマージ済みでないとみなす
        if command git branch --no-merged 2>/dev/null | command grep 'master' > /dev/null 2>&1 ; then
            hook_com[misc]+="(R)"
        fi
    }


    # stash 件数表示
    #
    # stash している場合は :SN という形式で misc (%m) に表示
    function +vi-git-stash-count() {
        # zstyle formats, actionformats の2番目のメッセージのみ対象にする
        if [[ "$1" != "1" ]]; then
            return 0
        fi

        local stash
        stash=$(command git stash list 2>/dev/null | wc -l | tr -d ' ')
        if [[ "${stash}" -gt 0 ]]; then
            # misc (%m) に追加
            hook_com[misc]+=":S${stash}"
        fi
    }

fi

function _update_vcs_info_msg() {
    local -a messages
    local prompt

    LANG=en_US.UTF-8 vcs_info

    if [[ -z ${vcs_info_msg_0_} ]]; then
        # vcs_info で何も取得していない場合はプロンプトを表示しない
        prompt=""
    else
        # vcs_info で情報を取得した場合
        # $vcs_info_msg_0_ , $vcs_info_msg_1_ , $vcs_info_msg_2_ を
        # それぞれ緑、黄色、赤で表示する
        [[ -n "$vcs_info_msg_0_" ]] && messages+=( "%F{green}${vcs_info_msg_0_}%f" )
        [[ -n "$vcs_info_msg_1_" ]] && messages+=( "%F{yellow}${vcs_info_msg_1_}%f" )
        [[ -n "$vcs_info_msg_2_" ]] && messages+=( "%F{red}${vcs_info_msg_2_}%f" )

        # 間にスペースを入れて連結する
        prompt="${(j: :)messages}"
    fi

    RPROMPT="$prompt"
}
add-zsh-hook precmd _update_vcs_info_msg
