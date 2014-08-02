function peco-function-list () {
    local selected=$(functions | grep "^.*\ ()\ {" | sed -e "s| () {||" | grep peco- | grep -v function-list | peco --query "$LBUFFER")
    if [ -n "$selected" ]; then
        ${selected}
    fi
}
zle -N peco-function-list
bindkey '^l' peco-function-list

function ghn_open() {
    local url=$(ghn list | peco --query "$LBUFFER")
    if [ -n "$url" ]; then
        open ${url}
    fi
}
zle -N ghn_open
bindkey '^o' ghn_open

function peco-src() {
    local selected_dir=$(ghq list --full-path | peco --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-src
bindkey '^S' peco-src

function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(\history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history

function peco-cdr () {
    local selected_dir=$(cdr -l | awk '{ print $2 }' | peco)
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-cdr

function percol-cdr () {
    local selected_dir=$(cdr -l | awk '{ print $2 }' | percol --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
#zle -N percol-cdr

# setting for peco
#for f (~/.zsh/peco-sources/*) source "${f}" # load peco sources
bindkey '^r' peco-select-history
bindkey '^@' peco-cdr

function peco-cd () {
    local proj_root=$(find-proj-root)
    local gitignore="${proj_root}/.gitignore"

    if [ -z "$proj_root" ]; then
        echo -e "\nproject root path was not found." 1>&2
        zle accept-line
        return
    fi

    ignore_opt_str='-name .git'
    if [ -f "$gitignore" ]; then
        ignore_opt_str+=$(egrep -v -e '^#' -e '^ *$' "$gitignore" | perl -npe "s/^/ -o -name '/; s/\n/'/")
    fi

    local selected_dir=$(
        cd "$proj_root" &&
        echo "find . \( $ignore_opt_str \) -prune -o -maxdepth 10 -type d -print" |
          sh | peco --query "$LBUFFER"
    )

    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${proj_root}/${selected_dir#./}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-cd

bindkey '^x'  peco-cd

zle -N peco-snippets
bindkey '^x^x' peco-snippets

function peco-snippets() {

    local SNIPPETS=$(cat ~/.sheets/* | peco --query "$LBUFFER" | pbcopy)
        zle clear-screen
}

zle -N peco-snippets
bindkey '^x^s' peco-snippets

#function peco-snippets() {
#
#    local line
#    local snippet
#
#    if [ ! -e ~/.snippets ]; then
#        echo "~/.snippets is not found." >&2
#        return 1
#    fi
#
#    line=$(grep -v "^#" ~/.snippets | peco --query "$LBUFFER")
#    if [ -z "$line" ]; then
#        return 1
#    fi
#    
#    snippet=$(echo "$line" | sed "s/^\[[^]]*\] *//g")
#    if [ -z "$snippet" ]; then
#        return 1
#    fi
#
#    BUFFER=$snippet
#    zle clear-screen
#}
#
#zle -N peco-snippets
#bindkey '^x^x' peco-snippets

