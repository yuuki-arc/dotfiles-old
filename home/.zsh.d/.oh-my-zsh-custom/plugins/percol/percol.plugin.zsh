function percol-function-list () {
    local selected=$(functions | grep "^.*\ ()\ {" | sed -e "s| () {||" | grep percol- | grep -v function-list | percol --query "$LBUFFER")
    if [ -n "$selected" ]; then
        ${selected}
    fi
}
zle -N percol-function-list
bindkey '^l' percol-function-list

function ghn_open() {
    local url=$(ghn list | percol --query "$LBUFFER")
    if [ -n "$url" ]; then
        open ${url}
    fi
}
zle -N ghn_open
bindkey '^o' ghn_open

function percol-src() {
    local selected_dir=$(cygpath -u `ghq list --full-path` | percol --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N percol-src
bindkey '^S' percol-src

function percol-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(\history -n 1 | \
        eval $tac | \
        percol --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N percol-select-history

function percol-cdr () {
    local selected_dir=$(cdr -l | awk '{ print $2 }' | percol)
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N percol-cdr

function percol-cdr () {
    local selected_dir=$(cdr -l | awk '{ print $2 }' | percol --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
#zle -N percol-cdr

# setting for percol
#for f (~/.zsh/percol-sources/*) source "${f}" # load percol sources
bindkey '^r' percol-select-history
bindkey '^@' percol-cdr

function percol-cd () {
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
          sh | percol --query "$LBUFFER"
    )

    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${proj_root}/${selected_dir#./}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N percol-cd

bindkey '^x'  percol-cd

zle -N percol-snippets
bindkey '^x^x' percol-snippets

function percol-snippets() {

    local SNIPPETS=$(cat ~/.sheets/* | percol --query "$LBUFFER" > /dev/clipboard)
        zle clear-screen
}

zle -N percol-snippets
bindkey '^x^s' percol-snippets

#function percol-snippets() {
#
#    local line
#    local snippet
#
#    if [ ! -e ~/.snippets ]; then
#        echo "~/.snippets is not found." >&2
#        return 1
#    fi
#
#    line=$(grep -v "^#" ~/.snippets | percol --query "$LBUFFER")
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
#zle -N percol-snippets
#bindkey '^x^x' percol-snippets

